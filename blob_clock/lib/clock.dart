import 'dart:async';

import 'package:blob_clock/clockDigit.dart';
import 'package:blob_clock/clockSeparator.dart';
import 'package:blob_clock/clockTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';


enum _Element {
  background,
  color,
  outline,
}
final _lightBackground = "assets/img/lightBackground.png";

final _darkBackground = "assets/img/darkBackground.png";

final _lightTheme = {
  _Element.background: Color(0xFFF1F3F6),
  _Element.color: Color(0xFFEAA89A),
  _Element.outline: Colors.black,
};

final _darkTheme = {
  _Element.background: Color(0xFF414141),
  _Element.color: Color(0xFFC4C4C4),
  _Element.outline: Color(0xFFFFFFFF),
};

class Clock extends StatefulWidget {
  Clock( this.model);

  //const Clock(this.model);

  final ClockModel model;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  ClockTime _now = ClockTime();

  // Tick the clock
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _now = ClockTime();
      });
    });
    super.initState();
        widget.model.addListener(_updateModel);
    _updateModel();
  }
  @override
  void didUpdateWidget(Clock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
        final background = Theme.of(context).brightness == Brightness.light
        ? _lightBackground
        : _darkBackground;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Columns for the clock
            ClockDigit(
              digit: _now.hourTens,
              color: colors[_Element.color],
              backgroundColor: colors[_Element.background],
              outlineColor: colors[_Element.outline],
              bubbleFrequency: 0.2,
            ),
            ClockDigit(
              digit: _now.hourOnes,
              color: colors[_Element.color],
              backgroundColor: colors[_Element.background],
              outlineColor: colors[_Element.outline],
              bubbleFrequency: 0.4,
            ),
            ClockSeparator(
              color: colors[_Element.color],
              backgroundColor: colors[_Element.background],
              outlineColor: colors[_Element.outline],
            ),
            ClockDigit(
              digit: _now.minuteTens,
              color: colors[_Element.color],
              backgroundColor: colors[_Element.background],
              outlineColor: colors[_Element.outline],
              bubbleFrequency: 0.6,
            ),
            ClockDigit(
              digit: _now.minuteOnes,
              color: colors[_Element.color],
              backgroundColor: colors[_Element.background],
              outlineColor: colors[_Element.outline],
              bubbleFrequency: 0.8,
            ),
          ],
        ),
      ),
    );
  }
}