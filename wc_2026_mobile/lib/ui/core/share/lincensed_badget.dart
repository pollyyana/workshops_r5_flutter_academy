import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const LicensedBadget({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 7,
      ),
      decoration: ShapeDecoration(shape: StadiumBorder(), color: AppColors.ink),

      child: Text(
        '★  OFFICIAL LICENSED PRODUCT  ★',
        style: AppTextStyles.overline.copyWith(color: AppColors.cream),
      ),
    );
  }
}
