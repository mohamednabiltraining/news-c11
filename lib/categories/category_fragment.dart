import 'package:flutter/material.dart';
import 'package:news_app_c11_sun/categories/category_item.dart';
import 'package:news_app_c11_sun/model/category.dart';

typedef OnCategoryClickCallBack = void Function(Category);

class CategoryFragment extends StatelessWidget {
  // VoidCallback onClickSideMenu;
  final OnCategoryClickCallBack onCategoryClickCallBack;
  CategoryFragment({
    super.key,
    required this.onCategoryClickCallBack,
  });
  var categoryList = Category.getCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category \nof interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClickCallBack(categoryList[index]);
                  },
                  child: CategoryItem(
                    index: index,
                    category: categoryList[index],
                  ),
                );
              },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
