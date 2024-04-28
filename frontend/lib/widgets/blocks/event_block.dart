import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/separators/row_separator.dart';

class EventBlock extends StatefulWidget {
  final Event event;

  const EventBlock(this.event);

  @override
  State<EventBlock> createState() => _EventBlockState();
}

class _EventBlockState extends State<EventBlock> {
  @override
  void dispose() {
    widget.event.markAsSeen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          color: Palette.backgroundRowDark,
          child: Row(
            children: [
              Expanded(
                child: EventRows(
                  seen: widget.event.seen,
                  titleColor: widget.event.titleColor,
                  rows: widget.event.text,
                ),
              ),
              const HBox(10),
              Label(
                text: Formatter.hoursMinutes(widget.event.dateTime),
                color: widget.event.seen
                    ? Palette.textDisabled
                    : Palette.textPrimary,
              ),
            ],
          ),
        ),
        const RowSeparator(),
      ],
    );
  }
}

class EventRows extends StatelessWidget {
  final bool seen;
  final Color titleColor;
  final List<String> rows;

  const EventRows({
    required this.seen,
    required this.titleColor,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < rows.length; i++)
          Padding(
            padding: EdgeInsets.only(top: (i != 0) ? 5 : 0),
            child: Label(
              text: rows[i],
              color: seen
                  ? Palette.textDisabled
                  : ((i == 0) ? titleColor : Palette.textPrimary),
              weight: (i == 0) ? FontWeight.bold : FontWeight.normal,
            ),
          ),
      ],
    );
  }
}
