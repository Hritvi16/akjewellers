import 'dart:async';
import 'package:akjewellers/Screens/ProductList.dart';
import 'package:akjewellers/api/APIService.dart';
import 'package:akjewellers/api/Environment.dart';
import 'package:akjewellers/models/Banners.dart';
import 'package:akjewellers/models/SubCategory.dart';
import 'package:akjewellers/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:akjewellers/Screens/Containers/HomeScreen.dart';
import '../colors/MyColors.dart';

class SubCategoryList extends StatefulWidget {
  final String cat_id, title;

  const SubCategoryList({Key key, this.cat_id, this.title}) : super(key: key);
  @override
  State<SubCategoryList> createState() => _State();
}

class _State extends State<SubCategoryList> {
  bool load;
  int _currentIndex = 0;
  PageController _pageController;
  List<SubCatData> sub_category = [];
  BannerData bannerData = BannerData();

  String cat_id = "";
  String title = "";

  @override
  void initState()
  {
    cat_id = widget.cat_id;
    title = widget.title;
    load = false;
    _pageController = PageController();
    start();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
        title: Text(
          title,
          style: TextStyle(
            color: MyColors.black,
            fontSize: MySize.font14(context),
            fontWeight: FontWeight.w400
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: MyColors.black,
          ),
        ),
        iconTheme:IconThemeData(color: MyColors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {

            },
          ),
          
        ],
      ),
      body: load ?
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: MySize.size150(context),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    ),
                  ]),
              child: Image.network(
                  Environment.url +
                      Environment.api +
                      Environment.media +
                      bannerData.image,
                  fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: MySize.size20(context),
            ),
            Flexible(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                primary: false,
                shrinkWrap: true,
                itemCount: sub_category.length,
                separatorBuilder: (BuildContext ctx, index) {
                  return SizedBox(height: MySize.size8(context),);
                },
                itemBuilder: (BuildContext ctx, index) {
                  return getSubCategoryDesign(sub_category[index], index);
                }
              ),
            ),
          ],
        ),
      )
      : Center(
        child: CircularProgressIndicator(
          color: MyColors.colorPrimary,
        ),
      ),
    );
  }

  start() async {
    await fetchCategoryBanner();
    fetchSubCategory();
  }

  Future<void> fetchCategoryBanner() async {
    Banners banners = await APIService().getCategoryBanner();
    if(banners.status)
      bannerData = banners.data[0];

    setState(() {

    });
  }

  Future<void> fetchSubCategory() async {
    Map<String, dynamic> data = {
      "cat_id" : cat_id
    };
    SubCategory sub_categories = await APIService().getSubCategory(data);
    for (int i = 0; i < sub_categories.data.length; i++) {
      sub_category.add(sub_categories.data[i]);
    }
    load = true;
    setState(() {

    });
  }

  Widget getSubCategoryDesign(SubCatData subCatData, int ind) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductList(sub_cat_id: subCatData.id, title: subCatData.name,)));
      },
      child: Container(
        height: MySize.size70(context),
        padding: EdgeInsets.only(left: MySize.size12(context)),
        color: ind%2==0 ? MyColors.listColor1 : MyColors.listColor2,
        child: Row(
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.network(
                  Environment.url + Environment.api + Environment.media + subCatData.image
                ),
              ),
              flex: 2,
              fit: FlexFit.tight,
            ),
            Flexible(
              child: Text(
                subCatData.name.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: MySize.font14(context)
                ),
              ),
              flex: 3,
              fit: FlexFit.tight,
            )
          ],
        ),
      ),
    );
  }
}
