import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/events/event.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/separators/row_separator.dart';

class EventBlock extends StatelessWidget {
  final Event event;

  const EventBlock(this.event);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          child: Row(
            children: [
              Expanded(
                child: Label(
                  text: event.toString(),
                  color: Palette.textMain,
                ),
              ),
              const HBox(10),
              Label(
                text: Formatter.hoursMinutes(event.dateTime),
                color: Palette.textMain,
              ),
            ],
          ),
        ),
        const RowSeparator(),
      ],
    );
  }
}
