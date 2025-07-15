// import 'package:clone_app/widgets/customTextField.dart';
// import 'package:clone_app/widgets/customTextfield_bsecureText.dart';
// import 'package:clone_app/widgets/custom_button.dart';
// import 'package:clone_app/widgets/custom_icon_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_tumour_detector/core/widgets/custom_icon_button.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
    const   CustomIconButton(
      
         icon: Icons.g_mobiledata_rounded,
       ),
       SizedBox(
         width: 10.w,
       ),
    const   CustomIconButton(
         icon: Icons.facebook_outlined,
       ),
       SizedBox(
         width: 10.w,
       ),
    const   CustomIconButton(
         icon: Icons.fingerprint,
       ),
     ],
                      );
  }
}
