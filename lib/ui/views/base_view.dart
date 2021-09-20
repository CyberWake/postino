import 'package:flutter/material.dart';
import 'package:postino/services/service_locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView({
    required this.builder,
    this.onModelReady,
  });
  final Function(T)? onModelReady;
  final Widget Function(BuildContext, T, Widget?) builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model = serviceLocator<T>();

  @override
  void initState() {
    widget.onModelReady?.call(
      model,
    );
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
