import 'dart:async';
import 'package:akjewellers/Screens/ProductDetails.dart';
import 'package:akjewellers/api/APIService.dart';
import 'package:akjewellers/api/Environment.dart';
import 'package:akjewellers/models/Banners.dart';
import 'package:akjewellers/models/Product.dart';
import 'package:akjewellers/models/SubCategory.dart';
import 'package:akjewellers/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:akjewellers/Screens/Containers/HomeScreen.dart';
import '../colors/MyColors.dart';

class ProductList extends StatefulWidget {
  final String sub_cat_id, title;

  const ProductList({Key key, this.sub_cat_id, this.title}) : super(key: key);
  @override
  State<ProductList> createState() => _State();
}

class _State extends State<ProductList> {
  bool load;
  int _currentIndex = 0;
  PageController _pageController;
  List<ProductData> product = [];
  BannerData bannerData = BannerData();

  String sub_cat_id = "";
  String title = "";

  @override
  void initState()
  {
    sub_cat_id = widget.sub_cat_id;
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
      Column(
        children: [
          Container(
            height: MySize.size150(context),
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20.0),
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
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
                    mainAxisSpacing: 20),
                itemCount: product.length,
                itemBuilder: (BuildContext ctx, index) {
                  return getProductDesign(product[index], index);
                }),
          ),
        ],
      )
      : Center(
        child: CircularProgressIndicator(
          color: MyColors.colorPrimary,
        ),
      ),
    );
  }

  start() async {
    await fetchSubCategoryBanner();
    fetchProduct();
  }

  Future<void> fetchSubCategoryBanner() async {
    Banners banners = await APIService().getSubCategoryBanner();
    if(banners.status)
      bannerData = banners.data[0];

    setState(() {

    });
  }

  Future<void> fetchProduct() async {
    Map<String, dynamic> data = {
      "sub_cat_id" : sub_cat_id
    };
    Product product = await APIService().getProduct(data);
    this.product = [];
    if(product.status) {
      for (int i = 0; i < product.data.length; i++) {
        //stories.add(getStories(categories.data[i]));
        this.product.add(product.data[i]);
      }
    }
    load = true;
    setState(() {

    });
  }

  Widget getProductDesign(ProductData productData, int ind) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetails(p_id: productData.productId)));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            border: ind%2==0 ?
            Border(
              bottom: BorderSide(color: MyColors.grey30, width: 1),
              right: BorderSide(color: MyColors.grey30, width: 0.5),
            )
                : Border(
              bottom: BorderSide(color: MyColors.grey30, width: 1),
              left: BorderSide(color: MyColors.grey30, width: 0.5),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  Environment.url + Environment.api + Environment.media + productData.image,
                  fit: BoxFit.fill,
                ),
              ),
              flex: 3,
              fit: FlexFit.tight,
            ),
            Flexible(
              child: Center(
                child: Text(
                  productData.name.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: MySize.font14(context)
                  ),
                ),
              ),
              flex: 1,
              fit: FlexFit.tight,
            )
          ],
        ),
      ),
    );
  }
}
