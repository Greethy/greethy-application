import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greethy_application/ui/theme/theme.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.isLoading,
    this.color,
    this.textColor,
    this.labelStyle,
    this.isWrapped = false,
    this.borderRadius = 6.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String label;
  final TextStyle? labelStyle;
  final ValueNotifier<bool>? isLoading;
  final bool isWrapped;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isWrapped ? null : double.infinity,
      child: ValueListenableBuilder<bool>(
        valueListenable: isLoading ?? ValueNotifier(false),
        builder: (context, loading, child) {
          return TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(padding),
              backgroundColor: MaterialStateProperty.all(
                // loading ? Theme.of(context).disabledColor : color ?? Theme.of(context).primaryColor,
                loading ? Theme.of(context).disabledColor : color ?? GreethyColor.kawa_green,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
              ),
              overlayColor: MaterialStateProperty.all(color ?? Theme.of(context).primaryColorDark),
              foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onPressed: loading ? null : onPressed,
            child: loading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: FittedBox(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(color ?? Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  )
                : child!,
          );
        },
        child: Text(
          label,
          style: labelStyle ??
              GoogleFonts.mulish(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: textColor ?? Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
