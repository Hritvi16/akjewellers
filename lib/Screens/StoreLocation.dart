import 'package:akjewellers/colors/MyColors.dart';
import 'package:akjewellers/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:map_launcher/map_launcher.dart';

class StoreLocation extends StatefulWidget {
  const StoreLocation({Key key}) : super(key: key);

  @override
  _StoreLocationState createState() => _StoreLocationState();
}

class _StoreLocationState extends State<StoreLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey10.withOpacity(1),
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
        title: Text(
          "Store Location",
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MySize.size16(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    print(availableMaps);
                    await availableMaps.first.showMarker(
                      coords: Coords(22.486349767531244, 88.2753326360524),
                      // coords: Coords(double.parse(hotelInfo.hotel?.hgLat??"0"),double.parse(hotelInfo.hotel?.hgLong??"0")),
                      title: "A.K. Jewellers, 10A, Kasthadanga Rd, Joth Shibrampur, Shibrampur Mauza, Kolkata, West Bengal 700061",
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(MySize.size10(context)),
                    height: MySize.size85(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MySize.size5(context)),
                        color: MyColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                          ),
                        ]
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: MyColors.blue300,
                          size: MySize.size18(context),
                        ),
                        SizedBox(
                          width: MySize.size10(context),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: MySize.size2(context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Branch 1",
                                  style: TextStyle(
                                    color: MyColors.blue300,
                                    fontSize: MySize.font15(context),
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size5(context),
                                ),
                                Text(
                                  "10A, Kasthadanga Rd, Joth Shibrampur, Shibrampur Mauza, Kolkata, West Bengal 700061",
                                  style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: MySize.font13(context),
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final availableMaps = await MapLauncher.installedMaps;

                    await availableMaps.first.showMarker(
                      coords: Coords(22.487264710912196, 88.27789669243411),
                      // coords: Coords(double.parse(hotelInfo.hotel?.hgLat??"0"),double.parse(hotelInfo.hotel?.hgLong??"0")),
                      title: "A.K. Jewellers, 407, Ho Chi Minh Sarani, Shibrampur, Sarsuna, Kolkata, West Bengal 700061",
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(MySize.size10(context)),
                    margin: EdgeInsets.only(top: MySize.size16(context)),
                    height: MySize.size85(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MySize.size5(context)),
                        color: MyColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                          ),
                        ]
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: MyColors.orange,
                          size: MySize.size18(context),
                        ),
                        SizedBox(
                          width: MySize.size10(context),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: MySize.size2(context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Branch 2",
                                  style: TextStyle(
                                    color: MyColors.orange,
                                    fontSize: MySize.font15(context),
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(
                                  height: MySize.size5(context),
                                ),
                                Text(
                                  "407, Ho Chi Minh Sarani, Shibrampur, Sarsuna, Kolkata, West Bengal 700061",
                                  style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: MySize.font13(context),
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
