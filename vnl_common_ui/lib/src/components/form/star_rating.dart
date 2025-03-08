import 'package:flutter/services.dart';
import 'package:vnl_common_ui/vnl_ui.dart';

class StarRatingController extends ValueNotifier<double> with ComponentController<double> {
  StarRatingController([super.value = 0.0]);
}

class ControlledStarRating extends StatelessWidget with ControlledComponent<double> {
  @override
  final double initialValue;
  @override
  final ValueChanged<double>? onChanged;
  @override
  final bool enabled;
  @override
  final StarRatingController? controller;

  final double step;
  final Axis direction;
  final double max;
  final Color? activeColor;
  final Color? backgroundColor;
  final double starPoints;
  final double? starSize;
  final double? starSpacing;
  final double? starPointRounding;
  final double? starValleyRounding;
  final double? starSquash;
  final double? starInnerRadiusRatio;
  final double? starRotation;

  const ControlledStarRating({
    super.key,
    this.controller,
    this.initialValue = 0.0,
    this.onChanged,
    this.enabled = true,
    this.step = 0.5,
    this.direction = Axis.horizontal,
    this.max = 5.0,
    this.activeColor,
    this.backgroundColor,
    this.starPoints = 5,
    this.starSize,
    this.starSpacing,
    this.starPointRounding,
    this.starValleyRounding,
    this.starSquash,
    this.starInnerRadiusRatio,
    this.starRotation,
  });

  @override
  Widget build(BuildContext context) {
    return ControlledComponentBuilder(
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      enabled: enabled,
      builder: (context, data) {
        return StarRating(
          value: data.value,
          onChanged: data.onChanged,
          enabled: data.enabled,
          step: step,
          direction: direction,
          max: max,
          activeColor: activeColor,
          backgroundColor: backgroundColor,
          starPoints: starPoints,
          starSize: starSize,
          starSpacing: starSpacing,
          starPointRounding: starPointRounding,
          starValleyRounding: starValleyRounding,
          starSquash: starSquash,
          starInnerRadiusRatio: starInnerRadiusRatio,
          starRotation: starRotation,
        );
      },
    );
  }
}

class StarRating extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double step;
  final Axis direction;
  final double max;
  final Color? activeColor;
  final Color? backgroundColor;
  final double starPoints;
  final double? starSize;
  final double? starSpacing;
  final double? starPointRounding;
  final double? starValleyRounding;
  final double? starSquash;
  final double? starInnerRadiusRatio;
  final double? starRotation;
  final bool? enabled;

  const StarRating({
    super.key,
    required this.value,
    this.onChanged,
    this.step = 0.5,
    this.direction = Axis.horizontal,
    this.max = 5.0,
    this.activeColor,
    this.backgroundColor,
    this.starPoints = 5,
    this.starSize,
    this.starSpacing,
    this.starPointRounding,
    this.starValleyRounding,
    this.starSquash,
    this.starInnerRadiusRatio,
    this.starRotation,
    this.enabled,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> with FormValueSupplier<double, StarRating> {
  double? _changingValue;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    formValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant StarRating oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      formValue = widget.value;
    }
  }

  @override
  void didReplaceFormValue(double value) {
    widget.onChanged?.call(value);
  }

  Widget _buildStar(BuildContext context, [bool focusBorder = false]) {
    final theme = Theme.of(context);
    final scaling = theme.scaling;
    var starValleyRounding = widget.starValleyRounding ?? 0.0;
    var starSquash = widget.starSquash ?? 0.0;
    var starInnerRadiusRatio = widget.starInnerRadiusRatio ?? 0.4;
    var starRotation = widget.starRotation ?? 0.0;
    var starSize = widget.starSize ?? 24.0;
    return Container(
      width: starSize * scaling,
      height: starSize * scaling,
      decoration: ShapeDecoration(
        color: !focusBorder ? Colors.white : null,
        shape: StarBorder(
          points: widget.starPoints,
          pointRounding: widget.starPointRounding ?? (theme.radius / 2),
          valleyRounding: starValleyRounding * theme.radius,
          squash: starSquash,
          innerRadiusRatio: starInnerRadiusRatio,
          rotation: starRotation,
          side:
              focusBorder && _focused
                  ? BorderSide(
                    color: theme.colorScheme.ring,
                    width: 2.0 * scaling,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  )
                  : BorderSide.none,
        ),
      ),
    );
  }

  bool get _enabled => widget.enabled ?? widget.onChanged != null;

  @override
  Widget build(BuildContext context) {
    double roundedValue = ((_changingValue ?? widget.value) / widget.step).round() * widget.step;
    return AnimatedValueBuilder(
      value: roundedValue,
      duration: kDefaultDuration,
      builder: (context, roundedValue, child) {
        final theme = Theme.of(context);
        final scaling = theme.scaling;
        var starSize = widget.starSize != null ? widget.starSize! : 24.0 * scaling;
        var starSpacing = widget.starSpacing != null ? widget.starSpacing! : 5.0 * scaling;
        return FocusableActionDetector(
          enabled: _enabled,
          mouseCursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
          onShowFocusHighlight: (showFocus) {
            setState(() {
              _focused = showFocus;
            });
          },
          onShowHoverHighlight: (showHover) {
            if (!showHover) {
              setState(() {
                _changingValue = null;
              });
            }
          },
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.arrowRight): IncreaseStarIntent(widget.step),
            LogicalKeySet(LogicalKeyboardKey.arrowLeft): DecreaseStarIntent(widget.step),
          },
          actions: {
            IncreaseStarIntent: CallbackAction<IncreaseStarIntent>(
              onInvoke: (intent) {
                if (widget.onChanged != null) {
                  widget.onChanged!((roundedValue + intent.step).clamp(0.0, widget.max));
                }
                return;
              },
            ),
            DecreaseStarIntent: CallbackAction<DecreaseStarIntent>(
              onInvoke: (intent) {
                if (widget.onChanged != null) {
                  widget.onChanged!((roundedValue - intent.step).clamp(0.0, widget.max));
                }
                return;
              },
            ),
          },
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (widget.onChanged != null && roundedValue != widget.value) {
                widget.onChanged!(roundedValue);
              }
            },
            child: Flex(
              direction: widget.direction,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < widget.max.ceil(); i++)
                  MouseRegion(
                    hitTestBehavior: HitTestBehavior.translucent,
                    onHover: (event) {
                      if (!_enabled) return;
                      if (widget.onChanged == null) return;
                      double progress = (event.localPosition.dx / starSize).clamp(0.0, 1.0);
                      setState(() {
                        _changingValue = (i + progress);
                      });
                    },
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: [
                                widget.activeColor ??
                                    (_enabled ? theme.colorScheme.primary : theme.colorScheme.mutedForeground),
                                widget.backgroundColor ?? theme.colorScheme.muted,
                              ],
                              stops: [(roundedValue - i).clamp(0.0, 1.0), (roundedValue - i).clamp(0.0, 1.0)],
                              begin:
                                  widget.direction == Axis.horizontal ? Alignment.centerLeft : Alignment.bottomCenter,
                              end: widget.direction == Axis.horizontal ? Alignment.centerRight : Alignment.topCenter,
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcIn,
                          child: _buildStar(context),
                        ),
                        _buildStar(context, true),
                      ],
                    ),
                  ),
              ],
            ).gap(starSpacing),
          ),
        );
      },
    );
  }
}

class IncreaseStarIntent extends Intent {
  final double step;

  const IncreaseStarIntent(this.step);
}

class DecreaseStarIntent extends Intent {
  final double step;

  const DecreaseStarIntent(this.step);
}
