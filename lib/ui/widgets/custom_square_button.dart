import 'package:flutter/material.dart';
import 'package:postino/services/service_locator.dart';

class CustomSquareButton extends StatelessWidget {
  const CustomSquareButton({
    Key? key,
    required this.borderRadius,
    this.onTap,
    required this.icon,
    required this.size,
    required this.backgroundColor,
  }) : super(key: key);
  final double borderRadius;
  final double size;
  final Color backgroundColor;
  final void Function()? onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(
        sizeConfig.getPropWidth(borderRadius),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(sizeConfig.getPropWidth(borderRadius)),
        ),
        child: Container(
          height: sizeConfig.getPropHeight(size),
          width: sizeConfig.getPropHeight(size),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              sizeConfig.getPropWidth(borderRadius),
            ),
          ),
          child: icon,
        ),
      ),
    );
  }
}
