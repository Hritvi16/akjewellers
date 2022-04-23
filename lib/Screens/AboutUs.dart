import 'package:akjewellers/api/APIService.dart';
import 'package:akjewellers/api/Environment.dart';
import 'package:akjewellers/colors/MyColors.dart';
import 'package:akjewellers/models/Response.dart';
import 'package:akjewellers/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  String aboutUs = "A K Jewellers is Kolkata's renowned fine jewellery brand focusing on giving YOU an awesome jewellery buying experience for over 30 Years. At A K Jewellers we strive to provide you the largest collection of curated designs for every occasion. We are not just selling jewellery, but an unparalleled jewellery buying experience at your fingertips!\n\n"

  "Shining bright with a young team focused on innovation, customer happiness and transparency, A K Jewellers addresses the growing demands of today's always on-the-go consumers to discover, explore, buy and know more about their jewellery. Our policies provide easy returns, best after-sell service, BIS Hallmark, 100% certified jewellery, life-time exchange, best and transparent prices and unique designs all under one roof.\n\n"

  "Find us on Facebook & Instagram. We would love to connect with you. To share your thoughts or get your queries answered, please feel free to reach us on our number 8617725591 or 7003631581 or send us an email at akjewellerskolkata@gmail.com\n\n"

  "Think Jewellery, Think A K Jewellers!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey10.withOpacity(1),
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
        title: Text(
          "About Us",
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
                Text(
                  "About The A K JEWELLERS",
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: MySize.font16(context),
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: MySize.size16(context),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(MySize.size5(context)),
                    child: Container(
                      height: MySize.size150(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(MySize.size5(context)),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                            ),
                          ]),
                      child: Image.asset(
                          "assets/aboutus.jpg",
                          fit: BoxFit.fill,
                          width: 1000),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: MySize.size20(context)),
                  padding: EdgeInsets.all(MySize.size10(context)),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(MySize.size10(context))
                  ),
                  child: Text(
                    aboutUs,
                    style: TextStyle(
                      fontSize: MySize.font14(context)
                    ),
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
