import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/controllers/localization_controller.dart';
import 'package:balonsistem/modules/login/login_controller.dart';
import 'package:balonsistem/shared/constants/paddings.dart';
import 'package:balonsistem/shared/enums/app_icons.dart';
import 'package:balonsistem/shared/enums/app_images.dart';
import 'package:balonsistem/shared/widgets/custom_language_button.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:balonsistem/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: controller.constants.colors.primary,
      body: Padding(
        padding: AppPaddings.instance.horizontal12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _loginAppIcon(),
            SizedBox(
              height: 50.h,
            ),
            TextSemiBold(
              text: controller.constants.strings.welcome.tr,
              color: controller.constants.colors.white54,
              fontsize: 16.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextSemiBold(
              text: controller.constants.strings.appName,
              fontsize: 18.sp,
            ),
            SizedBox(
              height: 10.h,
            ),
            _loginBoardWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _loginBoardWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: AppPaddings.instance.horizontal12,
          width: 1.sw,
          height: 0.45.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: controller.constants.colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextSemiBold(
                text: controller.constants.strings.loginDescription.tr,
                fontsize: 12.sp,
                color: controller.constants.colors.secondary,
              ),
              InpuTextBox(
                controller: controller.emailController,
                boxbcgcolor: controller.constants.colors.greylightcolor,
                hinttext: controller.constants.strings.email.tr,
                keyboardtype: TextInputType.emailAddress,
                isboldinput: true,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
              ),
              InpuTextBox(
                boxbcgcolor: controller.constants.colors.greylightcolor,
                hinttext: controller.constants.strings.password.tr,
                keyboardtype: TextInputType.visiblePassword,
                obscuretext: true,
                controller: controller.passwordController,
                isboldinput: true,
                textCapitalization: TextCapitalization.none,
              ),
              SizedBox(
                width: 1.sw,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: Text(
                    controller.constants.strings.login.tr,
                  ),
                ),
              ),
              GetBuilder<LocalizationController>(
                builder: (localizationController) => _LanguageButton(
                    localizationController: localizationController),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material _loginAppIcon() {
    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: AppPaddings.instance.all16,
        decoration: BoxDecoration(
          color: controller.constants.colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        height: 125.h,
        width: 125.w,
        child: AppImages.brandIcon.png,
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  const _LanguageButton({
    required this.localizationController,
  });
  final LocalizationController localizationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomLanguageButton(
            widget: SizedBox(height: 40.h, width: 60.w, child: AppIcons.us.svg),
            languageModel: localizationController.languages[0],
            localizationController: localizationController,
            index: 0),
        CustomLanguageButton(
            widget: SizedBox(height: 40.h, width: 60.w, child: AppIcons.tr.svg),
            languageModel: localizationController.languages[1],
            localizationController: localizationController,
            index: 1),
      ],
    );
  }
}
