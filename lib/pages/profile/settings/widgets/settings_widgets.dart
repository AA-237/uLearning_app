import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgtes/base_text_widget.dart';

AppBar buildSettingsAppBar() {
  return AppBar(
    title: Container(
      child: Container(
        child: reusableText('Settings')
      ),
    ),
  );
}

Widget setttingButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Logout'),
              content: const Text('Confirm Logout'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: func,
                  child: const Text('Confirm'),
                ),
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/icons/Logout.png'),
        ),
      ),
    ),
  );
}
