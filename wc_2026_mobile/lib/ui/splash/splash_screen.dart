import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/share/lincensed_badget.dart';
import 'package:wc_2026_mobile/ui/core/share/logo_card.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_text_styles.dart';
import 'package:wc_2026_mobile/ui/splash/widget/boot_bar.dart';

class const SplashScreen({super.key}) extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final _boot = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 2400),
  );

  @override
  void initState() {
    super.initState();
    _boot.forward().then((_) => exitWhenReady());
  }

  @override
  void dispose() {
    _boot.dispose();
    super.dispose();
  }

  void exitWhenReady() {
    if (!mounted ||!_boot.isCompleted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Terminou a animação'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          SvgPicture.asset(AppAssets.patterns.paniniArcSplashSvg, fit: .cover),
          ColoredBox(color: AppColors.cream.withValues(alpha: .35)),
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    const LicensedBadget(),
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 290,
                        maxHeight: 380,
                      ),
                      child: LogoCard(),
                    ),
                    const SizedBox(height: 36),
                    Text('SEU ÁLBUM', style: AppTextStyles.display),
                    Text(
                      'OFICIAL',
                      style: AppTextStyles.display.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 290),
                      child: SizedBox(
                        height: 72,
                        child: AnimatedBuilder(
                          animation: _boot,
                          builder: (_, _) => BootBar(progress: _boot.value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
