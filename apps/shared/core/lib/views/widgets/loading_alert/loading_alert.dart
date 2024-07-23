import 'package:core/views/widgets/loading_alert/loading_widget.dart';
import 'package:flutter/material.dart';

class LoadingAlert {
  LoadingAlert._sharedInstance();
  static final LoadingAlert _shared = LoadingAlert._sharedInstance();

  // Factory constructor to prevent multiple instance
  factory LoadingAlert.instance() => _shared;

  static bool _isLoadingAlertVisible = false;
  // Function to show loader
  static void show(BuildContext context,
      {bool barrierDismissible = false,
      double height = 150,
      double width = 150}) {
    if (!_isLoadingAlertVisible) {
      _isLoadingAlertVisible = true;
      showGeneralDialog(
          barrierDismissible: barrierDismissible,
          context: context,
          barrierColor: Colors.white.withOpacity(0.3),
          pageBuilder: (BuildContext context, _, __) {
            return PopScope(
              canPop: true,
              onPopInvoked: (isLoading) async {
                _isLoadingAlertVisible = false;
              },
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: LoadingWidget(
                    height: height,
                    width: width,
                  ),
                ),
              ),
            );
          });
    }
  }

  // Function to remove loader
  static void remove(BuildContext context) {
    if (_isLoadingAlertVisible) {
      Navigator.of(context).pop();
      _isLoadingAlertVisible = false;
    }
  }
}
