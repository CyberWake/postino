import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postino/business_login/utils/svg_images.dart';
import 'package:postino/business_login/view_models/auth_screen_view_model.dart';
import 'package:postino/services/service_locator.dart';
import 'package:postino/ui/views/base_view.dart';

class AuthScreenView extends StatelessWidget {
  const AuthScreenView({Key? key}) : super(key: key);

  Widget buildTabButton(
    BuildContext context,
    AuthScreenViewModel model,
    int index,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () => model.changeTab(index),
        child: Padding(
          padding: EdgeInsets.only(bottom: sizeConfig.getPropHeight(10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index == 0 ? 'Login' : 'Signup',
                style: model.page == index
                    ? Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: const Color(0xFF1A3764))
                    : Theme.of(context).textTheme.headline2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: sizeConfig.getPropWidth(9),
                ),
                child: SvgPicture.string(
                  model.page == index
                      ? SvgImages.dotColor
                      : SvgImages.dotColorless,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    BuildContext context, {
    required String fieldName,
    required Widget textField,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.headline4,
        ),
        const Spacer(),
        Container(
          height: sizeConfig.getPropHeight(64),
          padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.getPropWidth(23),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(sizeConfig.getPropWidth(19)),
          ),
          child: textField,
        )
      ],
    );
  }

  Widget buildPageView(
    BuildContext context,
    AuthScreenViewModel model,
    int index,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizeConfig.getPropWidth(57),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (index == 1)
            Container(
              margin: EdgeInsets.only(bottom: sizeConfig.getPropHeight(26)),
              height: sizeConfig.getPropHeight(93),
              child: buildTextField(
                context,
                fieldName: 'Name',
                textField: TextFormField(
                  controller: model.name,
                  keyboardType: TextInputType.name,
                  autofillHints: const <String>[AutofillHints.name],
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
              ),
            ),
          SizedBox(
            height: sizeConfig.getPropHeight(93),
            child: buildTextField(
              context,
              fieldName: 'Phone',
              textField: TextFormField(
                controller: model.phone,
                keyboardType: TextInputType.phone,
                autofillHints: const <String>[AutofillHints.telephoneNumber],
                enableSuggestions: true,
                onFieldSubmitted: (value) => model.requestOTPDialog(),
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: sizeConfig.getPropHeight(26)),
            height: sizeConfig.getPropHeight(93),
            child: Row(
              children: [
                SizedBox(
                  width: sizeConfig.getPropWidth(218),
                  child: buildTextField(
                    context,
                    fieldName: 'OTP',
                    textField: TextFormField(
                      controller: model.otp,
                      keyboardType: TextInputType.phone,
                      autofillHints: const <String>[
                        AutofillHints.telephoneNumber
                      ],
                      enableSuggestions: true,
                      decoration: const InputDecoration(
                        hintText: "We'll auto verify OTP",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: sizeConfig.getPropWidth(16),
                    top: sizeConfig.getPropHeight(31.5),
                  ),
                  child: Material(
                    borderRadius:
                        BorderRadius.circular(sizeConfig.getPropHeight(19)),
                    color: const Color(0xFF54C1DD),
                    child: InkWell(
                      onTap: model.authenticate,
                      child: Container(
                        height: sizeConfig.getPropHeight(64),
                        width: sizeConfig.getPropHeight(64),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF54C1DD),
                          borderRadius: BorderRadius.circular(
                              sizeConfig.getPropHeight(19)),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthScreenViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    sizeConfig.getPropWidth(147),
                    sizeConfig.getPropHeight(137),
                    sizeConfig.getPropWidth(147),
                    sizeConfig.getPropHeight(68.25),
                  ),
                  child: SvgPicture.string(
                    SvgImages.logo,
                    height: sizeConfig.getPropHeight(120),
                    width: sizeConfig.getPropHeight(120),
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF94A2B8), width: 0.25),
                    ),
                  ),
                  height: sizeConfig.getPropHeight(35.5),
                  width: sizeConfig.getPropWidth(276),
                  margin: EdgeInsets.only(
                    bottom: sizeConfig.getPropHeight(29.5),
                  ),
                  child: Row(
                    children: List.generate(
                      2,
                      (index) => buildTabButton(context, model, index),
                    ),
                  ),
                ),
                SizedBox(
                  height: sizeConfig.getPropHeight(505.75),
                  child: PageView.builder(
                    controller: model.controller,
                    itemBuilder: (BuildContext context, int index) {
                      return buildPageView(context, model, index);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
