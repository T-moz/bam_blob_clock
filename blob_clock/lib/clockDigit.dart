import 'dart:async';
import 'dart:math';

import 'package:blob_clock/Bubble.dart';
import 'package:blob_clock/digit.dart';
import 'package:blob_clock/digitClipper.dart';
import 'package:blob_clock/painters/upperLiquide.painter.dart';
import 'package:flutter/material.dart';
import 'package:path_morph/path_morph.dart';

import 'painters/bubble.painter.dart';
import 'painters/loader.painter.dart';
import 'painters/outline.painter.dart';

const MIN_BUBBLE_RADIUS = 1.0;
const MAX_BUBBLE_RADIUS = 8.0;

const MIN_BUBBLE_DURATION = 6;
const MAX_BUBBLE_DURATION = 18;

class ClockDigit extends StatefulWidget {
  final Digit digit;
  final Color color;
  final Color backgroundColor;
  final Color outlineColor;
  final double bubbleFrequency;

  const ClockDigit({
    Key key,
    @required this.digit,
    @required this.color,
    @required this.backgroundColor,
    @required this.outlineColor,
    @required this.bubbleFrequency,
  })  : assert(digit != null, 'digit is required'),
        assert(color != null, 'color is required'),
        assert(backgroundColor != null, 'backgroundColor is required'),
        assert(outlineColor != null, 'outlineColor is required'),
        assert(bubbleFrequency != null, 'bubbleFrequency is required'),
        assert(bubbleFrequency >= 0 && bubbleFrequency <= 1,
            'bubbleFrequency is between 0 and 1'),
        super(key: key);

  @override
  _ClockDigitState createState() => _ClockDigitState();
}

class _ClockDigitState extends State<ClockDigit> with TickerProviderStateMixin {
  AnimationController _loaderAnimationController;
  Animation<double> _loaderAnimation;
  AnimationController _liquidSurfaceAnimationController;
  Animation<double> _liquidSurfaceAnimation;
  AnimationController _upperliquidSurfaceAnimationController;
  Animation<double> _upperliquidSurfaceAnimation;
  List<Bubble> _bubbles;
  SampledPathData _morphingPathData1;
  SampledPathData _morphingPathData2;

  AnimationController _morphingPathControllerDigitBlob;
  AnimationController _morphingPathControllerBlobDigit;

  bool triggerAnimation;

  @override
  void initState() {
    triggerAnimation = true;
    _init();
    super.initState();
  }

  void func1(int i, Offset z) {
    setState(() {
      _morphingPathData2.shiftedPoints[i] = z;
    });
  }

  void func2(int i, Offset z) {
    setState(() {
      _morphingPathData2.shiftedPoints[i] = z;
    });
  }

  @override
  void didUpdateWidget(ClockDigit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.digit.value != widget.digit.value) {
      _disposeAnimationControllers();
      triggerAnimation = !triggerAnimation;
      _init();
    }
  }

  @override
  void dispose() {
    for (final bubble in _bubbles) {
      bubble.animationController.dispose();
    }
    _disposeAnimationControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        clipper: DigitBoxClipper(widget.digit.viewBox),
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: DigitClipper(
                PathMorph.generatePath(_morphingPathData1),
              ),
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: widget.digit.viewBox.height,
                width: widget.digit.viewBox.width,
                color: widget.color.withOpacity(0.2),
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _loaderAnimation,
                      builder: (_, child) {
                        return AnimatedBuilder(
                          animation: _liquidSurfaceAnimation,
                          builder: (_, child) {
                            return CustomPaint(
                              size: Size.infinite,
                              painter: LoaderPainter(
                                progress: _loaderAnimation.value,
                                liquidSurface: _liquidSurfaceAnimation.value,
                                color: widget.color,
                                backgroundColor: widget.backgroundColor,
                                clearCanvas: _loaderAnimation.isCompleted,
                                viewBox: widget.digit.viewBox,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _loaderAnimation,
                      builder: (_, child) {
                        return AnimatedBuilder(
                          animation: _upperliquidSurfaceAnimation,
                          builder: (_, child) {
                            return CustomPaint(
                              size: Size.infinite,
                              painter: Upperliquide(
                                liquidSurface:
                                    _upperliquidSurfaceAnimation.value,
                                color: widget.color,
                                backgroundColor: widget.backgroundColor,
                                clearCanvas: _loaderAnimation.isCompleted,
                                viewBox: widget.digit.viewBox,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    ..._bubbles
                        .where((bubble) => bubble.controllerDisposed == false)
                        .map((bubble) => AnimatedBuilder(
                              animation: bubble.animation,
                              builder: (_, child) {
                                bubble.animationController.forward();
                                final dy = (1 - bubble.animation.value) *
                                        (widget.digit.viewBox.height +
                                            bubble.radius) -
                                    bubble.radius;
                                return CustomPaint(
                                  size: Size.infinite,
                                  painter: BubblePainter(
                                    bubble: bubble,
                                    dy: dy,
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: bubble.color,
                                radius: bubble.radius,
                              ),
                            )),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 4),
              height: widget.digit.viewBox.height,
              width: widget.digit.viewBox.width,
              child: CustomPaint(
                size: Size.infinite,
                painter: OutlinePainter(
                  path: PathMorph.generatePath(_morphingPathData1),
                  color: widget.outlineColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _init() {
    _loaderAnimationController = AnimationController(
      duration: widget.digit.timeLeftBeforeDigitUpdate,
      vsync: this,
    );
    _loaderAnimation =
        Tween(begin: widget.digit.initialProgress, end: 1.0).animate(
      CurvedAnimation(
        parent: _loaderAnimationController,
        curve: Curves.linear,
      ),
    );
    _loaderAnimationController.forward();

    _liquidSurfaceAnimationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _liquidSurfaceAnimation = Tween(begin: -14.0, end: 14.0).animate(
      CurvedAnimation(
        parent: _liquidSurfaceAnimationController,
        curve: Curves.linear,
      ),
    );
    _liquidSurfaceAnimationController.repeat(reverse: true);

    _upperliquidSurfaceAnimationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _upperliquidSurfaceAnimation = Tween(begin: -7.0, end: 7.0).animate(
      CurvedAnimation(
        parent: _upperliquidSurfaceAnimationController,
        curve: Curves.linear,
      ),
    );
    _upperliquidSurfaceAnimationController.repeat(reverse: true);

    _bubbles = [];
    final timer = Timer.periodic(Duration(seconds: 1), (_) {
      final randomNumberGenerator = Random();
      if (randomNumberGenerator.nextDouble() >=
          (1.0 - widget.bubbleFrequency)) {
        setState(() {
          final bubble = _initBubble();
          _bubbles.add(bubble);
          Future.delayed(bubble.animationController.duration, () {
            bubble.animationController.dispose();
            bubble.controllerDisposed = true;
          });
        });
      }
    });
    Future.delayed(widget.digit.timeLeftBeforeDigitUpdate, () {
      timer.cancel();
    });

    _morphingPathData1 =
        PathMorph.samplePaths(widget.digit.path, widget.digit.blobPath);

    _morphingPathControllerDigitBlob =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    PathMorph.generateAnimations(
        _morphingPathControllerDigitBlob, _morphingPathData1, func1);


    _morphingPathData2 =
        PathMorph.samplePaths(widget.digit.blobPath, widget.digit.nextPath);

    _morphingPathControllerBlobDigit =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    PathMorph.generateAnimations(
        _morphingPathControllerBlobDigit, _morphingPathData2, func2);
    _morphingPathControllerBlobDigit.forward();
    Future.delayed(
        widget.digit.timeLeftBeforeDigitUpdate - Duration(milliseconds: 2500),
        () {
      _morphingPathControllerDigitBlob.forward();
    });
  }

  _disposeAnimationControllers() {
    _loaderAnimationController.dispose();
    _liquidSurfaceAnimationController.dispose();
    _upperliquidSurfaceAnimationController.dispose();
    _morphingPathControllerDigitBlob.dispose();
    _morphingPathControllerBlobDigit.dispose();
  }

  Bubble _initBubble() {
    final randomNumberGenerator = Random();
    final radius = (MIN_BUBBLE_RADIUS +
        randomNumberGenerator.nextDouble() *
            (MAX_BUBBLE_RADIUS - MIN_BUBBLE_RADIUS));
    final animationController = AnimationController(
      duration: Duration(
          seconds: (MIN_BUBBLE_DURATION +
              randomNumberGenerator
                  .nextInt(MAX_BUBBLE_DURATION - MIN_BUBBLE_DURATION))),
      vsync: this,
    );
    final dx = radius +
        randomNumberGenerator.nextDouble() *
            (widget.digit.viewBox.width - radius);
    return Bubble(
      animationController: animationController,
      color: widget.color,
      radius: radius,
      dx: dx,
    );
  }
}
