// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum _Element {
  background,
  fillText,
  strokeText
}

final _lightBackground = "assets/img/Clock with soft UI - background.png";

final _darkBackground =
    "assets/img/Clock with soft UI - darkmode - background.png";

final _lightTheme = {_Element.fillText: Color(0xFFEAA89A), _Element.strokeText: Colors.black};

final _darkTheme = {_Element.fillText: Color(0xFFC4C4C4),  _Element.strokeText: Colors.white};

/// A basic digital clock.
///
/// You can do better than this!
class BlobClock extends StatefulWidget {
  const BlobClock(this.model);

  final ClockModel model;

  @override
  _BlobClockState createState() => _BlobClockState();
}

class _BlobClockState extends State<BlobClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(BlobClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      // _timer = Timer(
      //   Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
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

    stderr.writeln(background);
    final hour = DateFormat(widget.model.is24HourFormat ? 'HH:mm' : 'hh:mm')
        .format(_dateTime);
    final fontSize = MediaQuery.of(context).size.width / 5;
    final offset = fontSize / 4;
    final strockStyle = TextStyle(
      fontFamily: 'Comfortaa',
      fontSize: fontSize,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = colors[_Element.strokeText],
    );
    final fillStyle = TextStyle(
      color: colors[_Element.fillText],
      fontFamily: 'Comfortaa',
      fontSize: fontSize,
    );
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 46.0, horizontal: 56.0),
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: offset + 4.0,
                  top: offset + 4.0,
                  child: DefaultTextStyle(style: fillStyle, child: Text(hour))),
              Positioned(
                  left: offset,
                  top: offset,
                  child:
                      DefaultTextStyle(style: strockStyle, child: Text(hour))),
            ],
          ),
        ),
      ),
    );
  }
}
