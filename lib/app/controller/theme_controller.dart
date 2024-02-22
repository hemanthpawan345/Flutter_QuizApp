import 'package:get/get.dart';
import 'package:myapp_2/app/theme/theme.dart';

class ThemeController extends GetxController {
  int index = 0;
  final themes = [
    AppThemes.blueTheme,
    AppThemes.orangeTheme,
    AppThemes.cyanTheme
  ];

  void increase() {
    index = (index + 1) % (themes.length);
  }
}
