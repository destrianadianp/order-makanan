import 'package:flutter/material.dart';
import 'package:order2/ui/color.dart';
import 'package:order2/ui/typography.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool disabled;
  final Gradient? gradient;
  final Color? textColor;
  final Size? maximumSize;
  final Color backgroundColor;
  final Color disabledColor;
  final Size? minimumSize;
  final Border? border;

  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.disabled = false,
    this.gradient,
    this.textColor,
    this.maximumSize,
    this.minimumSize,
    this.backgroundColor = primaryColor,
    this.border,
    this.disabledColor = disableColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: border,
      ),
      child: Material(
        color: onPressed != null ? backgroundColor : disabledColor,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          splashColor: primaryColor,
          borderRadius: BorderRadius.circular(999),
          onTap: onPressed != null
              ? () {
                  /// Dismiss keyboard
                  FocusManager.instance.primaryFocus?.unfocus();
                  onPressed!();
                }
              : null,
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: DefaultTextStyle.merge(
              style: title.copyWith(color: textColor),
              textAlign: TextAlign.center,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
