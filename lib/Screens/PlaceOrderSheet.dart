import 'package:akjewellers/api/APIService.dart';
import 'package:akjewellers/api/Environment.dart';
import 'package:akjewellers/colors/MyColors.dart';
import 'package:akjewellers/models/Response.dart';
import 'package:akjewellers/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';

class PlaceOrderSheet extends StatefulWidget {
  final String id, name, image;
  const PlaceOrderSheet({Key key, this.id, this.name, this.image}) : super(key: key);

  @override
  _PlaceOrderSheetState createState() => _PlaceOrderSheetState();
}

class _PlaceOrderSheetState extends State<PlaceOrderSheet> {
  bool fnValidate, lnValidate, mobileValidate, emailValidate, addressValidate;
  String fnError, lnError, mobileError, emailError, addressError;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String id = "";
  String name = "";
  String image = "";

  @override
  void initState() {
    id = widget.id;
    name = widget.name;
    image = widget.image;
    emailValidate = fnValidate = lnValidate = mobileValidate = addressValidate = false;
    emailError = fnError = lnError = mobileError = addressError = "";
    super.initState();
  }

  TextEditingController email = TextEditingController();
  TextEditingController fn = TextEditingController();
  TextEditingController ln = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
        title: Text(
          "Enquire Now",
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
          child: Form(
                key: formkey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: MySize.size90(context),
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(MySize.size8(context)),
                                child: Image.network(
                                  Environment.url + Environment.api + Environment.media + image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              flex: 1,
                              fit: FlexFit.tight,
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(MySize.size8(context)),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Product - ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.black,
                                      fontSize: MySize.font14(context)
                                    ),
                                    children: [
                                      TextSpan(
                                        text: name.toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                              ),
                              flex: 2,
                              fit: FlexFit.tight,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: fn,
                        cursorColor: MyColors.colorPrimary,
                        style: TextStyle(color: MyColors.black),
                        decoration: InputDecoration(
                          errorText: fnValidate ? fnError : null,
                          label: Text("First Name"),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          String message = "";
                          if (value.isEmpty) {
                            return "* Required";
                          } else {
                            return null;
                          }

                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: ln,
                        cursorColor: MyColors.colorPrimary,
                        style: TextStyle(color: MyColors.black),
                        decoration: InputDecoration(
                          errorText: lnValidate ? lnError : null,
                          label: Text("Last Name"),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          String message = "";
                          if (value.isEmpty) {
                            return "* Required";
                          } else {
                            return null;
                          }

                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: mobile,
                        cursorColor: MyColors.colorPrimary,
                        maxLength: 10,
                        style: TextStyle(color: MyColors.black),
                        decoration: InputDecoration(
                          errorText: mobileValidate ? mobileError : null,
                          label: Text("Mobile"),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          String message = "";
                          if (value.isEmpty) {
                            return "* Required";
                          } else if (value.length!=10) {
                            return "Enter valid phone number";
                          } else {
                            return null;
                          }

                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: email,
                        cursorColor: MyColors.colorPrimary,
                        style: TextStyle(color: MyColors.black),
                        decoration: InputDecoration(
                          errorText: emailValidate ? emailError : null,
                          label: Text("Email"),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          String message = "";
                          if (value.isEmpty) {
                            return "* Required";
                          } else if (!EmailValidator.validate(value)) {
                            return "Enter valid email address";
                          } else {
                            return null;
                          }

                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: address,
                        cursorColor: MyColors.colorPrimary,
                        style: TextStyle(color: MyColors.black),
                        decoration: InputDecoration(
                          errorText: addressValidate ? addressError : null,
                          label: Text("Address"),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          String message = "";
                          if (value.isEmpty) {
                            return "* Required";
                          } else {
                            return null;
                          }

                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              // if (validate() == 0) {
                              //   login();
                              // }
                              print("EmailValidator.validate(value)");
                              print(EmailValidator.validate(email.text));
                              if (formkey.currentState.validate()) {
                                print("Validated");
                                insertOrder();
                              } else {
                                print("Not Validated");
                              }
                            },
                            child: const Text("SUBMIT")),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
  sendToast(String message){

    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void insertOrder() async {
    Map<String, dynamic> data = {
      "product_id" : id,
      "firstname" : fn.text,
      "lastname" : ln.text,
      "email" : email.text,
      "mobile" : mobile.text,
      "address" : address.text,
      "message" : "Test Message",
    };
    Response response = await APIService().insertOrder(data);
    print(response.toJson());
    sendToast(response.message??"");

    if(response.status==true) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  int validate() {
    int cnt = 0;

    if (email.text.isEmpty) {
      setState(() {
        emailValidate = true;
        emailError = "Enter email";
      });
      cnt++;
    } else {
      emailValidate = false;
      emailError = "";
    }
    return cnt;
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
