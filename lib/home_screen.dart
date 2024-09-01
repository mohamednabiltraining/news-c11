import 'package:flutter/material.dart';
import 'package:news_app_c11_sun/categories/category_details.dart';
import 'package:news_app_c11_sun/categories/category_fragment.dart';
import 'package:news_app_c11_sun/home_drawer.dart';
import 'package:news_app_c11_sun/model/category.dart';
import 'package:news_app_c11_sun/settings/setting_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/main_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: HomeDrawer(
            onClickSideMenu: onSideMenuClick,
          ),
          appBar: AppBar(
            title: const Text('Home screen'),
            centerTitle: true,
            backgroundColor: Colors.green,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
          ),
          body: selectedSideMenu == SideMenuItemsEnum.settings
              ? const SettingFragment()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryClickCallBack: onCategoryClick,
                    )
                  : const CategoryDetails(),
        )
      ],
    );
  }

  SideMenuItemsEnum selectedSideMenu = SideMenuItemsEnum.categories;

  void onSideMenuClick(SideMenuItemsEnum newSideMenuItems) {
    selectedSideMenu = newSideMenuItems;
    Navigator.of(context).pop();
    selectedCategory = null;
    setState(() {});
  }

  Category? selectedCategory;
  void onCategoryClick(Category category) {
    selectedCategory = category;
    setState(() {});
  }
}

enum SideMenuItemsEnum { categories, settings }
