import 'package:flutter/material.dart';
import 'package:postino/services/service_locator.dart';

class CustomRoundRectButton extends StatelessWidget {
  const CustomRoundRectButton({
    Key? key,
    required this.child,
    this.onTap,
    this.size,
    this.borderColor = const Color(0xFF1A3764),
    this.fillColor = const Color(0xFF1A3764),
  }) : super(key: key);
  final void Function()? onTap;
  final Widget child;
  final Color borderColor;
  final Color fillColor;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: fillColor,
      borderRadius: BorderRadius.circular(
        sizeConfig.getPropWidth((size?.width ?? 300) / 15.78),
      ),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(
          sizeConfig.getPropWidth((size?.width ?? 300) / 15.78),
        ),
        child: Container(
          width: sizeConfig.getPropWidth(size?.width ?? 300),
          height: sizeConfig.getPropHeight(size?.height ?? 64),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(
              sizeConfig.getPropWidth((size?.width ?? 300) / 15.78),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
