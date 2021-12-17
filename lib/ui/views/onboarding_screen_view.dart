import 'package:flutter/material.dart';
import 'package:postino/business_login/view_models/onboarding_screen_view_model.dart';
import 'package:postino/services/service_locator.dart';
import 'package:postino/ui/views/base_view.dart';
import 'package:postino/ui/widgets/rounded_rectangular_border.dart';

class OnboardingScreenView extends StatefulWidget {
  const OnboardingScreenView({Key? key}) : super(key: key);

  @override
  _OnboardingScreenViewState createState() => _OnboardingScreenViewState();
}

class _OnboardingScreenViewState extends State<OnboardingScreenView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingScreenViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 518,
                child: PageView.builder(
                  itemCount: 3,
                  controller: model.controller,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/images/image-$index.png',
                      fit: BoxFit.fitHeight,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 378,
                child: Container(
                  alignment: Alignment.center,
                  width: sizeConfig.getPropWidth(414),
                  color: const Color(0xFFF7F6F2),
                  child: SizedBox(
                    width: sizeConfig.getPropWidth(242),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: model.opacity,
                          child: Text(
                            model.title[model.page],
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: model.opacity,
                          child: Text(
                            model.subTitle[model.page],
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: sizeConfig.getPropHeight(66),
                          ),
                          child: CustomRoundRectButton(
                            onTap: model.next,
                            child: Text(
                              'Start',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
