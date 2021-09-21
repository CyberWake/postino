import 'package:flutter/material.dart';
import 'package:postino/services/service_locator.dart';

class CustomRoundRectButton extends StatelessWidget {
  const CustomRoundRectButton({
    Key? key,
    required this.child,
    this.onTap,
    this.borderColor = const Color(0xFF1A3764),
    this.fillColor = const Color(0xFF1A3764),
  }) : super(key: key);
  final void Function()? onTap;
  final Widget child;
  final Color borderColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: fillColor,
      borderRadius: BorderRadius.circular(sizeConfig.getPropWidth(19)),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(sizeConfig.getPropWidth(19)),
        child: Container(
          width: sizeConfig.getPropWidth(300),
          height: sizeConfig.getPropHeight(64),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(sizeConfig.getPropWidth(19)),
          ),
          child: child,
        ),
      ),
    );
  }
}
