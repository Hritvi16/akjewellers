import 'dart:async';
import 'package:akjewellers/Screens/PlaceOrderSheet.dart';
import 'package:akjewellers/api/APIService.dart';
import 'package:akjewellers/api/Environment.dart';
import 'package:akjewellers/models/Product.dart' as p;
import 'package:akjewellers/models/ProductDetail.dart';
import 'package:akjewellers/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../colors/MyColors.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';

class ProductDetails extends StatefulWidget {
  final String p_id;

  const ProductDetails({Key key, this.p_id}) : super(key: key);
  @override
  State<ProductDetails> createState() => _State();
}

class _State extends State<ProductDetails> {
  bool load;
  int _currentIndex = 0;
  PageController _pageController;
  ProductData productData = ProductData();
  List<p.ProductData> similar_product = [];

  String p_id = "";
  String title = "";
  List<Widget> slideShow;

  var unescape = HtmlUnescape();

  @override
  void initState()
  {
    p_id = widget.p_id;
    load = false;
    slideShow = [];
    _pageController = PageController();
    fetchProductDetails();
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
          
        ],
      ),
      body: load ?
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: 200,
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3)),
                  items: slideShow),
            ),
            SizedBox(
              height: MySize.size12(context),
            ),
            getProductDetailDesign(),
            SizedBox(
              height: MySize.size20(context),
            ),
            Center(
              child: Text(
                "SIMILAR PRODUCTS",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: MySize.font16(context)
                ),
              ),
            ),
            SizedBox(
              height: MySize.size20(context),
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
                    mainAxisSpacing: 20),
                itemCount: similar_product.length,
                itemBuilder: (BuildContext ctx, index) {
                  return getProductDesign(similar_product[index], index);
                }),
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

  Widget getProductDetailDesign() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productData.name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: MySize.font18(context)
            ),
          ),
          Html(
            data: unescape.convert(productData.productDetails),
          ),
          SizedBox(
            height: MySize.size16(context),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "Item Weight",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: MySize.font14(context)
                    ),
                  ),
                  SizedBox(
                    height: MySize.size10(context),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MySize.size60(context),
                    width: MySize.size60(context),
                    decoration: BoxDecoration(
                        color: MyColors.gw,
                        shape: BoxShape.circle
                    ),
                    child: Text(
                      productData.weight,
                      style: TextStyle(
                          color: MyColors.white,
                          fontSize: MySize.font14(context)
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MySize.size20(context),
              ),
              Column(
                children: [
                  Text(
                    "Carat",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: MySize.font14(context)
                    ),
                  ),
                  SizedBox(
                    height: MySize.size10(context),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MySize.size60(context),
                    width: MySize.size60(context),
                    decoration: BoxDecoration(
                        color: MyColors.gw,
                        shape: BoxShape.circle
                    ),
                    child: Text(
                      productData.carat,
                      style: TextStyle(
                          color: MyColors.white,
                          fontSize: MySize.font14(context)
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: MySize.size10(context),
          ),
          Padding(
            padding: EdgeInsets.only(left: MySize.size10(context), right: MySize.size10(context)),
            child: Divider(
              thickness: 1,
              color: MyColors.black,
            ),
          ),
          SizedBox(
            height: MySize.size16(context),
          ),
          // Row(
          //   children: [
          //     Flexible(
          //       child: Image.network(
          //         Environment.url + Environment.api + Environment.media + we_set_us[0].image,
          //         fit: BoxFit.fill,
          //       ),
          //       fit: FlexFit.tight,
          //       flex: 1,
          //     ),
          //     Flexible(
          //       child: Image.network(
          //         Environment.url + Environment.api + Environment.media + we_set_us[1].image,
          //         fit: BoxFit.fill,
          //       ),
          //       fit: FlexFit.tight,
          //       flex: 1,
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: MySize.size16(context),
          // ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(MySize.size10(context)),
            margin: EdgeInsets.only(left: MySize.size10(context), right: MySize.size10(context)),
            height: MySize.size80(context),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: MyColors.info,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: MyColors.grey)
            ),
            child: Text(
              "Weight and price of the jewellery item may vary subject to the stock available.",
              style: TextStyle(
                color: MyColors.black,
                fontSize: MySize.font13(context)
              ),
            ),
          ),
          SizedBox(
            height: MySize.size12(context),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "For current pricing and customization",
              style: TextStyle(
                  fontSize: MySize.font14(context)
              ),
            ),
          ),
          SizedBox(
            height: MySize.size12(context),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                      PlaceOrderSheet(
                        id: productData.productId,
                        name: productData.name,
                        image: productData.image[0].src,
                      )
                    )
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(MySize.size10(context)),
                  margin: EdgeInsets.only(right: MySize.size10(context)),
                  height: MySize.size50(context),
                  decoration: BoxDecoration(
                    color: MyColors.colorAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Contact us",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: MySize.font16(context),
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(MySize.size10(context)),
                  margin: EdgeInsets.only(left: MySize.size10(context)),
                  height: MySize.size50(context),
                  decoration: BoxDecoration(
                    color: MyColors.colorAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Visit our showroom",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: MySize.font16(context),
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getProductDesign(p.ProductData productData, int ind) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetails(p_id: productData.productId)));
      },
      child: Container(
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

  // start() async {
  //   await fetWeSetUs();
  //   fetchProductDetails();
  // }

  Future<void> fetchProductDetails() async {
    Map<String, dynamic> data = {
      "product_id" : p_id
    };
    ProductDetail productDetail = await APIService().getProductDetails(data);
    productData = ProductData();
    if(productDetail.status) {
      productData = productDetail.data.first;
    }
    setState(() {

    });
    fetchImages();
  }

  Future<void> fetchImages() async {
    for (int i = 0; i < productData.image.length; i++) {
      print(Environment.url + productData.image[i].src);
      slideShow.add(
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              //padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                    ),
                  ]),
              child: Image.network(
                  Environment.url +
                      Environment.api +
                      Environment.media +
                      productData.image[i].src,
                  fit: BoxFit.fill,
                  width: 1000),
            )),
      );
    }
    setState(() {

    });
    fetchSimilarProduct();
  }

  Future<void> fetchSimilarProduct() async {
    Map<String, dynamic> data = {
      "sub_cat_id" : productData.subCatId
    };
    p.Product product = await APIService().getProduct(data);
    similar_product = [];
    if(product.status) {
      for (int i = 0; i < product.data.length; i++) {
        //stories.add(getStories(categories.data[i]));
        similar_product.add(product.data[i]);
      }
    }
    load = true;
    setState(() {

    });
  }

}
