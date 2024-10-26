import 'package:balonsistem/data/local/local_storage/index.dart';
import 'package:balonsistem/data/models/auth/resp/refresh_resp_model.dart';
import 'package:balonsistem/modules/navbar/navbar_controller.dart';
import 'package:balonsistem/routes/app_pages.dart';
import 'package:balonsistem/shared/constants/constants_instances.dart';
import 'package:balonsistem/shared/enums/user_data_keys.dart';
import 'package:balonsistem/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({
    super.key,
    required this.height,
    this.flexibleSpace,
  });

  final double height;
  final Widget? flexibleSpace;

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  final ConstantsInstances _constants = ConstantsInstances.instance;

  final navbarController = Get.find<NavBarController>();

  final LocalStorageService _localStorageService = LocalStorageService.instance;
  late final List<Company> companies;

  @override
  void initState() {
    super.initState();
    companies = _localStorageService.retrieveData(UserDataKeys.compaines.name);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
        expandedHeight: widget.height,
        floating: true,
        pinned: true,
        backgroundColor: _constants.colors.primary,
        leadingWidth: 130.w,
        leading: Padding(
          padding: _constants.paddings.left12,
          child: _chooseCompany(),
        ),
        actions: [
          _actionButton(
            () => Get.toNamed(Routes.lastAddedReservations),
            Icons.history,
          ),
          _actionButton(
            () => Get.toNamed(Routes.notifications),
            Icons.notifications,
          ),
          _actionButton(() => Get.toNamed(Routes.reservationAddUpdate),
              Icons.add_circle_outlined),
          _actionButton(
            () => navbarController.onTapNavBarItem(3),
            Icons.person,
          )
        ],
        flexibleSpace: widget.flexibleSpace);
  }

  Widget _chooseCompany() {
    return companies.length > 1
        ? Bounceable(
            onTap: () {},
            child: Row(
              children: [
                const TextExtraBold(text: "Bütün Firmalar "),
                Icon(
                  Icons.arrow_downward_sharp,
                  color: _constants.colors.white,
                  size: 14.r,
                ),
              ],
            ),
          )
        : Row(
            children: [
              TextExtraBold(text: companies.first.kisaUnvan),
            ],
          );
  }

  Padding _actionButton(void Function()? onTap, IconData icon) {
    return Padding(
      padding: _constants.paddings.right12,
      child: Bounceable(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _constants.colors.black.withOpacity(0.25),
            ),
            margin: EdgeInsets.only(right: 2.w),
            padding: EdgeInsets.all(4.sp),
            child: Icon(icon, color: _constants.colors.white)),
      ),
    );
  }
}
