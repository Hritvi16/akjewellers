import 'package:akjewellers/Screens/SubCategoryList.dart';
import 'package:akjewellers/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:akjewellers/models/Banners.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../api/APIService.dart';
import '../../api/Environment.dart';
import '../../colors/MyColors.dart';
import '../../models/Category.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  bool load;
  List<BannerData> banners = [];
  List<CatData> category = [];
  List<BannerData> we_set_us = [];
  List<Widget> slideShow;
  List<Widget> stories;

  @override
  void initState() {
    load = false;
    slideShow = [];
    stories = [];
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey10.withOpacity(0.2),
      resizeToAvoidBottomInset: true,
      body: load
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      color: MyColors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: category.length,
                          separatorBuilder: (BuildContext ctx, index) {
                            return SizedBox(width: 25,);
                          },
                          itemBuilder: (BuildContext ctx, index) {
                            return getStories(category[index]);
                          }),
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: MyColors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EXPLORE OUR DESIGN"
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: MySize.size120(context),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                primary: false,
                                shrinkWrap: true,
                                itemCount: category.length,
                                separatorBuilder: (BuildContext ctx, index) {
                                  return SizedBox(width: 25,);
                                },
                                itemBuilder: (BuildContext ctx, index) {
                                  return getExploreDesign(category[index]);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: MyColors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EXPLORE WITH US"
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: MySize.size60(context),
                            child: Row(
                              children: [
                                Flexible(
                                  child: getExploreWithUs("assets/explore/HJ.png", "HANDCRAFTED JEWELLERY"),
                                  flex: 1,
                                  fit: FlexFit.tight,
                                ),
                                Flexible(
                                  child: getExploreWithUs("assets/explore/TP.png", "TRANSPARENT PRICING"),
                                  flex: 1,
                                  fit: FlexFit.tight,
                                ),
                                Flexible(
                                  child: getExploreWithUs("assets/explore/CJ.png", "CERTIFIED JEWELLERY"),
                                  flex: 1,
                                  fit: FlexFit.tight,
                                ),
                                Flexible(
                                  child: getExploreWithUs("assets/explore/TJ.png", "TRUST OF AK JEWELLERY"),
                                  flex: 1,
                                  fit: FlexFit.tight,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width/2,
                      color: MyColors.white,
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Image.asset(
                        "assets/banner1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: MyColors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "WHAT SET US APART"
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: MySize.size100(context),
                            child: Row(
                              children: [
                                Flexible(
                                  child: getApart(we_set_us[0]),
                                  flex: 1,
                                  fit: FlexFit.tight,
                                ),
                                Flexible(
                                  child: getApart(we_set_us[1]),
                                  flex: 1,
                                  fit: FlexFit.tight,
                                ),
                                Flexible(
                                  child: getApart(we_set_us[2]),
                                  flex: 1,
                                  fit: FlexFit.tight,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width/2,
                      color: MyColors.white,
                      child: Image.asset(
                        "assets/banner2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]
              )
            )
          : Center(
              child: CircularProgressIndicator(
                color: MyColors.colorPrimary,
              ),
            ),
    );
  }
  start() async {
    await fetWeSetUs();
    await fetchCategory();
    await fetchBanners();
  }

  Future<void> fetWeSetUs() async {
    Banners banners = await APIService().getWeSetUs();
    if(banners.status)
      we_set_us = banners.data;

    setState(() {

    });
  }

  Future<void> fetchBanners() async {
    Banners ads = await APIService().getBanners();
    banners = ads.data;
    for (int i = 0; i < banners.length; i++) {
      print(Environment.url + banners[i].image);
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
                      banners[i].image,
                  fit: BoxFit.fill,
                  width: 1000),
            )),
      );
    }

    load = true;
    setState(() {

    });
  }

  Future<void> fetchCategory() async {
    Category categories = await APIService().getCategory();
    for (int i = 0; i < categories.data.length; i++) {
      //stories.add(getStories(categories.data[i]));
      category.add(categories.data[i]);
    }
  }

  // Widget getStories(CatData data) {
  //   return CircleAvatar(
  //     backgroundImage: NetworkImage(
  //         Environment.url + Environment.api + Environment.media + data.image),
  //     radius: 60.0,
  //     child: Text(data.name,style: TextStyle(
  //       color: Colors.black,
  //     ),),
  //   );
  // }

  Widget getStories(CatData data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SubCategoryList(cat_id: data.id, title: data.name,)));
      },
      child: Container(
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: MyColors.colorAccent,
              radius: MySize.size20(context)+1,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: MySize.size20(context),
                  backgroundImage: NetworkImage(
                      Environment.url + Environment.api + Environment.media + data.image)
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MySize.font12(context)
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getExploreDesign(CatData data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SubCategoryList(cat_id: data.id, title: data.name,)));
      },
      child: Container(
        width: MySize.size80(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MySize.size90(context),
              width: MySize.size80(context),
              child: Image.network(
                Environment.url + Environment.api + Environment.media + data.image,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: MyColors.grey10))
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  data.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MySize.font12(context)
                  ),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: MyColors.white,
          boxShadow: [
            BoxShadow(color: MyColors.grey10, blurRadius: 2.0, spreadRadius: 0.4)
          ]
        ),
      ),
    );
  }

  Widget getExploreWithUs(String img, String title) {
    return Column(
      children: [
        Container(
          height: MySize.size20(context)+2,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: MySize.size8(context)),
          child: Image.asset(
            img,
            width: MySize.size20(context),
            height: MySize.size20(context),
          ),
        ),
        Flexible(
          child: Container(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MySize.font8(context)
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getApart(BannerData weSetUs) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: MySize.size8(context)),
            child: Image.network(
                Environment.url +
                    Environment.api +
                    Environment.media +
                    weSetUs.image,
              width: MediaQuery.of(context).size.width,
              height: MySize.size80(context),
              fit: BoxFit.fill,
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                weSetUs.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: MySize.font8(context)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
