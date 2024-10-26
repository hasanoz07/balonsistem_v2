import 'package:balonsistem/base/base_scaffold.dart';
import 'package:balonsistem/modules/account/account_controller.dart';
import 'package:balonsistem/shared/constants/colors.dart';
import 'package:balonsistem/shared/enums/app_images.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          backgroundColor: controller.constants.colors.primary,
          elevation: 0,
          toolbarHeight: 20.h,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              _AppBarWidget(controller: controller),
              SizedBox(
                height: 10.h,
              ),
              _routeGoToWebsite(
                title: "Telif Hakkı",
                uri: controller.telifHakki,
              ),
              _routeGoToWebsite(
                title: "Kullanım Koşulları",
                uri: controller.kullanimKosullari,
              ),
              _routeGoToWebsite(
                title: "Gizlilik",
                uri: controller.gizlilikPolitikasi,
              ),
              _routeGoToWebsite(
                title: "Kişisel Veriler",
                uri: controller.kisiselVeriler,
              ),
              _routeGoToWebsite(
                title: "Çerez Politikası",
                uri: controller.cerezPolitikasi,
              ),
              _notificationStatusWidget(),
              _logOutButton(),
              SizedBox(
                height: 45.h,
              ),
              _bottomWidget(),
            ],
          ),
        ));
  }

  ListTile _routeGoToWebsite({required String title, required Uri uri}) {
    return ListTile(
      title: TextRegular(
        text: title,
        color: controller.constants.colors.black,
        fontsize: 16.sp,
      ),
      leading: Icon(
        Boxicons.bx_copyright,
        color: controller.constants.colors.primary,
      ),
      onTap: () {
        controller.goToWebSite(uri);
      },
      trailing: const Icon(Icons.chevron_right_outlined),
    );
  }

  Obx _notificationStatusWidget() {
    return Obx(
      () => ListTile(
        title: TextRegular(
            text: "Bildirimler",
            color: controller.constants.colors.black,
            fontsize: 16.sp),
        leading: controller.notificationStatus.value
            ? Icon(
                Icons.notifications_active_outlined,
                color: AppColors.instance.primary,
              )
            : Icon(
                Icons.notifications_off_outlined,
                color: AppColors.instance.red,
              ),
        onTap: () async {
          controller.logOut();
        },
        trailing: CupertinoSwitch(
          value: controller.notificationStatus.value,
          activeColor: AppColors.instance.primary,
          onChanged: (bool? value) {
            controller.notificationStatus.value = value ?? false;
          },
        ),
      ),
    );
  }

  ListTile _logOutButton() {
    return ListTile(
      title: TextBold(
          text: "Çıkış Yap",
          color: controller.constants.colors.black,
          fontsize: 14.sp),
      leading: Icon(Icons.logout, color: controller.constants.colors.red),
      onTap: () async {
        controller.logOut();
      },
      trailing: const Icon(Icons.chevron_right_outlined),
    );
  }

  Column _bottomWidget() {
    return Column(
      children: [
        AppImages.splashBranding.pngWithAttiributes(height: 65.h),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "Balon Sistem 1.0.0",
          style: TextStyle(color: controller.constants.colors.greydark),
        ),
        SizedBox(
          height: 30.h,
        )
      ],
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({
    required this.controller,
  });

  final AccountController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 1.sw,
      decoration: BoxDecoration(color: controller.constants.colors.primary),
      child: Padding(
        padding: controller.constants.paddings.horizontal12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextExtraBold(
              text: "Hesabım",
              fontsize: 20.sp,
              color: controller.constants.colors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  size: 80.r,
                  color: controller.constants.colors.greydark,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSemiBold(
                      text: "ABC Medya Destek",
                      fontsize: 24.sp,
                      color: controller.constants.colors.white,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextLight(
                        text: "Süper Admin",
                        fontsize: 12.sp,
                        color: controller.constants.colors.greydark)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
