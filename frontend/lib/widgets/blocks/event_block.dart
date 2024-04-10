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
          color: Palette.backgroundRow,
          child: Row(
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      widget.event.seen ? Palette.transparent : Palette.error,
                ),
              ),
              const HBox(10),
              Expanded(
                child: Label(
                  text: widget.event.toString(),
                  color: Palette.textMain,
                ),
              ),
              const HBox(10),
              Label(
                text: Formatter.hoursMinutes(widget.event.dateTime),
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
