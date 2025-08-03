import 'dart:convert';
import 'dart:io';
import 'package:xml2json/xml2json.dart';
import 'json/json_battlefield.dart';
import 'json/json_region.dart';
import 'json/json_vertex.dart';

typedef Json = Map<String, dynamic>;

typedef Vertex = List<int>;

void main(List<String> args) async {
  await processFile('tool/input/maps');
}

Future<void> processFile(String levelFolder) async {
  final File svgFile = File('$levelFolder/test_map.svg');
  final Json json = await getJson(svgFile);

  final int width = int.parse(
    (json['svg']['width'] as String).replaceAll('mm', ''),
  );
  final int height = int.parse(
    (json['svg']['height'] as String).replaceAll('mm', ''),
  );

  final List<JsonRegion> regions = getRegions(
    json: json,
    name: 'regions',
  );

  final JsonBattlefield battlefield = JsonBattlefield(
    id: 'test',
    width: width,
    height: height,
    regions: regions,
  );

  writeLevel(fileName: 'test_map', battlefield: battlefield);
}

Future<Json> getJson(File file) async {
  final String contents = await file.readAsString();

  final Xml2Json xml2json = Xml2Json();
  xml2json.parse(contents);
  final String gdata = xml2json.toGData();

  return jsonDecode(gdata);
}

List<JsonRegion> getRegions({
  required Json json,
  required String name,
}) {
  final List<JsonRegion> result = [];

  for (final Json g in json['svg']['g']) {
    if (g['id'] == name) {
      for (final Json path in g['path']) {
        final String id = path['id'];
        final String pathString = path['d'];
        result.add(
          JsonRegion(
            id: id,
            vertices: getCoordinates(pathString),
          ),
        );
      }
    }
  }

  return result;
}

Vertices getCoordinates(String pathString) {
  final RegExp commandRegExp = RegExp(r'[A-Z][^A-Z]*');
  final Iterable<Match> matches = commandRegExp.allMatches(pathString);
  final Vertices result = [];
  double startX = 0;
  double startY = 0;
  double currentX = 0;
  double currentY = 0;

  for (final Match match in matches) {
    final String command = match.group(0)!;
    final String type = command[0];
    final List<double> args = command
        .substring(1)
        .trim()
        .split(RegExp(r'[\s,]+'))
        .where((s) => s.isNotEmpty)
        .map(double.parse)
        .toList();

    switch (type) {
      case 'M':
      case 'L':
        for (int i = 0; i < args.length; i += 2) {
          final double x = args[i];
          final double y = args[i + 1];
          result.add([round(x), round(y)]);
          currentX = x;
          currentY = y;
          if (type == 'M') {
            startX = x;
            startY = y;
          }
        }
        break;

      case 'H':
        for (final x in args) {
          currentX = x;
          result.add([round(currentX), round(currentY)]);
        }
        break;

      case 'V':
        for (final y in args) {
          currentY = y;
          result.add([round(currentX), round(currentY)]);
        }
        break;

      case 'Z':
      case 'z':
        currentX = startX;
        currentY = startY;
        break;

      default:
        throw Exception('Unsupported command: $type');
    }
  }

  return result;
}

num round(num value) => num.parse(value.toStringAsFixed(2));

void writeLevel({
  required String fileName,
  required JsonBattlefield battlefield,
}) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final String json = encoder.convert(battlefield);
  final File outputDart = File('tool/output/$fileName.json');
  outputDart.writeAsStringSync(json);
}
