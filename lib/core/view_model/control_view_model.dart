import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../view/add_product_view.dart';
import '../../view/chat_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';
import '../../view/search_people.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget _currentScreen = HomeView();

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = SearchView();
          break;
        }
      case 2:
        {
          _currentScreen = AddProductView();
          break;
        }
      case 3:
        {
          _currentScreen = ChatView();
          break;
        }
      case 4:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    update();
  }

  void goToCategoryPage(Widget newPage) {
    _currentScreen = newPage;
    update();
  }
}
