// ignore_for_file: must_be_immutable, unused_field

import 'package:cheeta/core/view_model/control_view_model.dart';
import 'package:cheeta/model/category_model.dart';
import 'package:cheeta/view/add_product_view.dart';
import 'package:cheeta/view/auth/login_view.dart';
import 'package:cheeta/view/control_view.dart';
import 'package:cheeta/view/widgets/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../constance.dart';
import '../../core/view_model/home_view_model.dart';
import '../category_view.dart';
import '../widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                appBar: AppBar(
                  //title: const Text('Welcome', style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.transparent,
                  bottomOpacity: 0.0,
                  elevation: 0.0,
                  toolbarHeight: 80,
                  //SearchBar
                  title: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                /* Clear the search field */
                              },
                            ),
                            hintText: 'Search',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                //Categories
                body: _listViewCategories()
                //bottom navigation bar
                ));
  }

  Widget _listViewCategories() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => SingleChildScrollView(
              child: StaggeredGridView.countBuilder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.categoryModel.length,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    CategoryModel model = controller.categoryModel[index];

                    String name = controller.categoryModel[index].name!;
                    String image = controller.categoryModel[index].image!;

                    return GetBuilder<ControlViewModel>(
                        builder: (controller) => GestureDetector(
                            onTap: () {
                              controller.goToCategoryPage(CategoryView(
                                model: model,
                              ));
                            },
                            child: CustomCard(
                              text: name,
                              image: image,
                            )));
                  },
                  staggeredTileBuilder: (context) =>
                      const StaggeredTile.fit(1)),
            ));
  }
}
