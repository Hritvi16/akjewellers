import 'package:akjewellers/api/APIService.dart';
import 'package:akjewellers/api/Environment.dart';
import 'package:akjewellers/colors/MyColors.dart';
import 'package:akjewellers/models/Response.dart';
import 'package:akjewellers/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({Key key}) : super(key: key);

  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
        title: Text(
          "Help and Support",
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "CONTACT US",
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
                          "assets/contactus.jpg",
                          fit: BoxFit.fill,
                          width: 1000),
                    )
                ),
                SizedBox(
                  height: MySize.size20(context),
                ),
                Row(
                  children: [
                    getInfo(Icons.email_outlined, "Email", "email.com"),
                    getInfo(Icons.phone_android_rounded, "Phone", "+91 98744 11470")
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  getInfo(IconData icon, String label, String info) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: MyColors.colorPrimary,
            size: MySize.size14(context),
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
                    label,
                    style: TextStyle(
                        color: MyColors.colorPrimary,
                        fontSize: MySize.font14(context),
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: MySize.size5(context),
                  ),
                  Text(
                    info,
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
    );
  }
}
