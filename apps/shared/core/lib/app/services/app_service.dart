import 'package:core/app/data/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:user_home/features/home/presentation/widgets/car_details/book_sheet.dart';

class AppServices {
  const AppServices._();

  static Future<T?> showDefaultModalSheet<T>({
    required BuildContext context,
    required bool isDismissible,
    required bool isScrollable,
    required Widget child,
    bool expand = false,
    bool useSafeArea = false,
    Color backgroundColor = const Color(0xffF1F1F1),
  }) async =>
      showModalBottomSheet(
        context: context,
        backgroundColor: backgroundColor,
        barrierColor: Colors.black.withOpacity(0.5),
        enableDrag: isDismissible,
        isDismissible: isDismissible,
        isScrollControlled: true,
        useSafeArea: useSafeArea,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) => isScrollable
            ? SingleChildScrollView(
                child: SafeArea(
                  bottom: false,
                  child: child,
                ),
              )
            : child,
      );

  static Future<void> bookNowSheet({
    required BuildContext context,
    required CarModel car,
  }) async {
    return AppServices.showDefaultModalSheet(
      context: context,
      isDismissible: true,
      isScrollable: false,
      child: BookSheet(car: car),
    );
  }
}
