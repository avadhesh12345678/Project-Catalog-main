import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:Project_Catalog/app_localizations.dart';
import 'package:Project_Catalog/utils/Colors.dart';
import 'package:Project_Catalog/utils/app_widget.dart';
import 'package:Project_Catalog/utils/Constants.dart' as k;

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with WidgetsBindingObserver {
  var usernameCont = TextEditingController();
  var fullname = TextEditingController();
  var passwordCont = TextEditingController();
  var confirmPasswordCont = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('Sign Up State ===== $state');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenBackgroundColor,
      appBar: appBar(context, showTitle: false),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(k.spacingStandardNew),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            child: Image.asset(
                              k.Main_Logo,
                              width: 150,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 75),
                      child: Container(
                        child: Column(
                          children: [
                            EditText(
                              hintText:
                                  keyString(context, "hint_enter_full_name"),
                              isPassword: false,
                              mController: fullname,
                            ),
                            SizedBox(height: 14),
                            EditText(
                              hintText: keyString(context, "hint_enter_email"),
                              isPassword: false,
                              mController: usernameCont,
                            ),
                            SizedBox(height: 14),
                            EditText(
                              hintText:
                                  keyString(context, "hint_enter_password"),
                              isPassword: true,
                              mController: passwordCont,
                              isSecure: true,
                            ),
                            SizedBox(height: 14),
                            EditText(
                              hintText:
                                  keyString(context, "hint_re_enter_password"),
                              isPassword: true,
                              mController: confirmPasswordCont,
                              isSecure: true,
                            ),
                            SizedBox(height: 14.0),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    ShadowButton(
                      value: keyString(context, "lbl_sign_up"),
                      onPressed: () {
                        hideKeyboard(context);

                        // Create Request Here

                        if (!mounted) return;
                        setState(() {
                          if (fullname.text.isEmpty)
                            toast(keyString(context, "lbl_full_name") +
                                " " +
                                keyString(context, "lbl_field_required"));
                          else if (usernameCont.text.isEmpty)
                            toast(keyString(context, "lbl_email_id") +
                                " " +
                                keyString(context, "lbl_field_required"));
                          else if (passwordCont.text.isEmpty)
                            toast(keyString(context, "lbl_password") +
                                " " +
                                keyString(context, "lbl_field_required"));
                          else if (confirmPasswordCont.text.isEmpty)
                            toast(keyString(context, "lbl_re_enter_pwd") +
                                " " +
                                keyString(context, "lbl_field_required"));
                          else if (confirmPasswordCont.text !=
                              passwordCont.text)
                            toast(keyString(context, "lbl_pwd_not_match"));
                          else {
                            isLoading = true;

                            // Call Registration API
                          }
                        });
                      },
                    ).paddingOnly(left: 20, right: 20),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(keyString(context, "lbl_already_have_an_account"),
                            style: primaryTextStyle(
                                size: k.standardFontSize,
                                color: TextPrimaryColor,
                                fontFamily: k.AppFont)),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: GestureDetector(
                              child: Text(keyString(context, "lbl_sign_in"),
                                  style: TextStyle(
                                      fontSize: k.standardFontSize.toDouble(),
                                      color: primaryColor,
                                      fontFamily: k.AppFont)),
                              onTap: () {
                                Navigator.pop(context);
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          isLoading
              ? Container(
                  child: CircularProgressIndicator(),
                  alignment: Alignment.center,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
