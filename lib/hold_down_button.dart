library hold_down_button;

// Dart Packages
import 'dart:async';

// Flutter Packages
import 'package:flutter/material.dart';

/// The [HoldDownButton] is a [StatefulWidget] that can be held down to
/// repeatedly trigger an action.
///
/// Uses a [GestureDetector] to detect a `long press` and a
/// `long press release` to trigger or stop the repeated action.
///
/// If the [child] does not have an `onTap` method defined, the [onHoldDown]
/// method will be called, else priority is given to the [child]'s
/// `onTap` method.
class HoldDownButton extends StatefulWidget {
  /// Creates a [HoldDownButton] widget. Great to use when want to execute
  /// a function continuously when the button is hold.
  ///
  /// - Can be used to make any [Widget] execute a function periodically
  /// when it is hold down.
  /// - Curve/flow towards periodic function execution can be changed.
  /// (That is time between each initial function call can be customized.)
  /// - After a `long press` is detected, the [onHoldDown] function will
  /// be called immediately.
  HoldDownButton({
    super.key,
    required this.child,
    required this.onHoldDown,
    this.longWait = const Duration(milliseconds: 600),
    this.middleWait = const Duration(milliseconds: 400),
    this.minWait = const Duration(milliseconds: 250),
    this.holdWait = const Duration(milliseconds: 100),
  })  : assert(
          (longWait.inMicroseconds >= middleWait.inMicroseconds) &&
              (middleWait.inMicroseconds >= minWait.inMicroseconds) &&
              (minWait.inMicroseconds >= holdWait.inMicroseconds),
          'Initial delays should follow a descending order.',
        ),
        assert(!holdWait.isNegative, 'holdWait cannot be negative.');

  /// The widget to display.
  ///
  /// ### Note
  /// - Can be any widget except [Tooltip] or [Widget]s with `tooltip`
  /// attribute specified.
  /// - If [child] is an [InkWell] or related widget, then
  ///  provide it's `onTap` attribute to get splash effect.
  /// - If [child] has an `onTap` attribute, then it will be given the priority.
  final Widget child;

  /// The [Function] to call repeatedly when the button is hold.
  ///
  /// If [child] does not have an `onTap` attribute, then this function
  /// will be called.
  final VoidCallback onHoldDown;

  /// Delay between the `1st & 2nd` [onHoldDown] function call.
  final Duration longWait;

  /// Delay between the `2nd & 3rd` [onHoldDown] function call.
  final Duration middleWait;

  /// Delay between the `3rd & 4th` [onHoldDown] function call.
  final Duration minWait;

  /// [Duration] between each [onHoldDown] function call when the
  /// button is hold.
  final Duration holdWait;

  @override
  State<HoldDownButton> createState() => _HoldDownButtonState();
}

class _HoldDownButtonState extends State<HoldDownButton> {
  /// Stores the state of if the [HoldDownButton.child] is hold down.
  bool _isHolding = false;

  /// The [Timer] that will execute the [HoldDownButton.onHoldDown]
  /// function periodically.
  Timer? _timer;

  /// A [List] of [Duration] representing the delays between each
  /// initial [HoldDownButton.onHoldDown] function call.
  late final List<Duration> _waitTime = [
    widget.longWait,
    widget.middleWait,
    widget.minWait
  ];

  /// Start the flow towards periodic function execution and sets
  /// [_isHolding] to `true`.
  ///
  /// After the curve/flow is finished, a periodic timer will be started to
  /// execute the [HoldDownButton.onHoldDown] function.
  ///
  /// Called when the [HoldDownButton.child] is `long pressed`.
  Future<void> _onHoldStart() async {
    _isHolding = true;
    widget.onHoldDown();

    // Creating a delay curve for the initial function calls.
    for (final time in _waitTime) {
      await Future.delayed(time, () {});
      if (!_isHolding) return;
      widget.onHoldDown();
    }

    _timer = Timer.periodic(widget.holdWait, (_) {
      if (_isHolding) {
        widget.onHoldDown();
      }
    });
  }

  /// Stops the periodic timer to call [HoldDownButton.onHoldDown] function
  /// and sets [_isHolding] to `false`.
  ///
  /// Called when the [HoldDownButton.child] is `released`.
  void _onHoldEnd() {
    _isHolding = false;
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: _onHoldStart,
      onLongPressCancel: _onHoldEnd,
      onLongPressUp: _onHoldEnd,
      onTap: () => widget.onHoldDown(),
      child: widget.child,
    );
  }
}
