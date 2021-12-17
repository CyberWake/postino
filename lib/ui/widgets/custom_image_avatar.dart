import 'package:flutter/material.dart';
import 'package:postino/services/service_locator.dart';

class CustomImageAvatar extends StatelessWidget {
  CustomImageAvatar({
    Key? key,
    required this.size,
    required this.borderRadius,
    this.onTap,
    this.elevation,
    this.imageUrl,
    this.text,
  }) : super(key: key);
  final double size;
  final double borderRadius;
  final String? imageUrl;
  final String? text;
  final double? elevation;
  final void Function()? onTap;

  final Map<String, Color> backgroundColors = {
    "a": const Color(0xFFA4C639),
    "b": const Color(0xFFF4C2C2),
    "c": const Color(0xFF00CC99),
    "d": const Color(0xFFFF8C00),
    "e": const Color(0xFF50C878),
    "f": const Color(0xFFFC8EAC),
    "g": const Color(0xFFDAA520),
    "h": const Color(0xFFE3A857),
    "i": const Color(0xFF00A86B),
    "j": const Color(0xFFC3B091),
    "k": const Color(0xFFCCCCFF),
    "l": const Color(0xFFFFDB58),
    "m": const Color(0xFFFF6961),
    "n": const Color(0xFFF49AC2),
    "o": const Color(0xFFAEC6CF),
    "p": const Color(0xFF93C572),
    "q": const Color(0xFF93C572),
    "r": const Color(0xFFE0115F),
    "s": const Color(0xFFFF8C69),
    "t": const Color(0xFFE2725B),
    "u": const Color(0xFF5B92E5),
    "v": const Color(0xFFF3E5AB),
    "w": const Color(0xFFF5F5F5),
    "x": const Color(0xFF738678),
    "y": const Color(0xFFE6E200),
    "z": const Color(0xFFE5AA70),
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 3.0,
      borderRadius:
          BorderRadius.circular(sizeConfig.getPropWidth(borderRadius)),
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
          decoration: imageUrl != null
              ? BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.33),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(
                    sizeConfig.getPropWidth(borderRadius),
                  ),
                  color: Colors.white,
                  image: const DecorationImage(image: NetworkImage('')),
                )
              : BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.33),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(
                    sizeConfig.getPropWidth(borderRadius),
                  ),
                  color: backgroundColors[
                      "${text?.substring(0, 1).toLowerCase()}"],
                ),
          child: Text(
            text?.substring(0, 1) ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1A3764),
              fontSize: sizeConfig.getPropHeight(32),
            ),
          ),
        ),
      ),
    );
  }
}
