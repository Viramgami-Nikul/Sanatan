import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  Assets._();

  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsPngGen png = $AssetsPngGen();
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  SvgGenImage get icApple => const SvgGenImage('assets/svg/ic_apple.svg');
  SvgGenImage get icEmail => const SvgGenImage('assets/svg/ic_email.svg');
  SvgGenImage get icGoogle => const SvgGenImage('assets/svg/ic_google.svg');
  SvgGenImage get icLogoWhite =>
      const SvgGenImage('assets/svg/ic_logo_white.svg');
}

class $AssetsPngGen {
  const $AssetsPngGen();

  AssetGenImage get imgSplashLogo =>
      const AssetGenImage('assets/png/img_splash_logo.png');
}

class SvgGenImage {
  const SvgGenImage(this.path);

  final String path;

  SvgPicture svg({
    double? width,
    double? height,
    ColorFilter? colorFilter,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: colorFilter,
      fit: fit,
    );
  }
}

class AssetGenImage {
  const AssetGenImage(this.path);

  final String path;

  Image image({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
