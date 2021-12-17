import 'package:flutter/material.dart';
import 'package:postino/services/service_locator.dart';
import 'package:postino/ui/widgets/rounded_rectangular_border.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    this.successText,
    this.dialogTitle,
    this.reverse = false,
    this.secondaryButtonText = 'Close',
    this.secondaryButtonTap,
    required this.success,
    required this.dialogSubTitle,
  }) : super(key: key);
  final bool reverse;
  final Function()? success;
  final Function()? secondaryButtonTap;
  final String? successText;
  final String? dialogTitle;
  final String dialogSubTitle;
  final String secondaryButtonText;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      CustomRoundRectButton(
        size: const Size(100, 50),
        onTap: secondaryButtonTap ?? () => navigationService.pop(),
        child: Text(
          secondaryButtonText,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
      ),
      CustomRoundRectButton(
        size: const Size(100, 50),
        fillColor: const Color(0xFF54C1DD),
        borderColor: const Color(0xFF54C1DD),
        onTap: success,
        child: Text(
          successText ?? 'Confirm',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
      )
    ];
    return AlertDialog(
      title: Text(
        dialogTitle ?? "Confirmation",
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),
      ),
      content: Text(
        dialogSubTitle,
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: reverse ? actions.reversed.toList() : actions,
    );
  }
}
