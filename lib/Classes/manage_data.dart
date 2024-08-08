import 'package:car_booking_owner/Components/Constant/image.dart';
import 'package:car_booking_owner/Components/Constant/style_sheet.dart';

class ConstantSheet {
  ConstantSheet._constructor();

  static final ConstantSheet instance = ConstantSheet._constructor();

  factory ConstantSheet() {
    return instance;
  }

  //  APP TEXT THEME GET
  AppTextTheme get appTextTheme => AppTextTheme();

  //  APP COLORS GET
  final _appColors = AppColors();
  AppColors get appColors => _appColors;
  //  APP IMAGE  GET
  final _appimage = AppImage();
  AppImage get appimage => _appimage;
  //  APP IMAGE  GET
  final _svgimg = SvgImage();
  SvgImage get appsvgimg => _svgimg;
}
