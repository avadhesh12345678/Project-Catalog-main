// import 'dart:ffi';
// import 'dart:js_util';
// import 'package:http/http.dart';
// import 'package:Project_Catalog/Views/DashboardView.dart';
import 'package:Project_Catalog/Bloc/Login/LoginBloc.dart';
import 'package:Project_Catalog/Views/DashboardView.dart';
import 'package:Project_Catalog/Views/SignUpView.dart';
import 'package:Project_Catalog/utils/GradientPainter.dart';
import 'package:Project_Catalog/utils/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:Project_Catalog/utils/Colors.dart';
import 'package:Project_Catalog/app_localizations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:Project_Catalog/utils/Constants.dart' as k;
import 'package:Project_Catalog/NetworkUtil/APIHandler.dart';
import 'dart:convert';

class SignInViewModel {
  Future login(
      [String email, String password, Function(Welcome) completion]) async {
    var apiHandler = APIHandler.getInstance(
        baseURL: "https://www.iosapplication.net/app-catalog/");
    var response = await apiHandler.apiCall("login.php", APIMethod.post,
        params: {"email": email, "password": password});
    var decoded = json.decode(response.body);
    Welcome signInModel = Welcome.fromJson(decoded);
    completion(signInModel);
  }
}

// ignore: must_be_immutable
class SignInView extends StatefulWidget {
  SignInViewModel viewModel = SignInViewModel();

  login([String email, String password]) {
    viewModel.login(email, password, (param) {
      print(param);
      this.createState().isLoading = false;
      this.createState().setState(() {});
      DashboardView(loginData: param).launch(this.createState().currentContext);
    });
  }

  _SignInViewState _currentState;

  @override
  _SignInViewState createState() {
    if (_currentState == null) {
      _currentState = _SignInViewState();
    }
    return _currentState;
  }
}

class _SignInViewState extends State<SignInView> {
  // var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;
  bool isRemember = false;

  BuildContext currentContext;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    var remember = await getBool(k.REMEMBER_PASSWORD) ?? false;
    if (remember) {
      var password = await getString(k.PASSWORD);
      var email = await getString(k.EMAIL);

      setState(() {
        // usernameController.text = email;
        passwordController.text = password;
      });

      //  usernameController = usernameController;
    }
    setState(() {
      isRemember = remember;
    });
  }

  @override
  void dispose() {
    // usernameController.dispose();
    loginBloc.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Email Widget
  Widget emailField() {
    return StreamBuilder(
        stream: loginBloc.email,
        builder: (context, snapshot) {
          return EditText(
            onChanged: loginBloc.emailUpdate,
            keyboardType: TextInputType.emailAddress,
            hintText: keyString(context, "hint_enter_email"),
            isPassword: false,
            errorText: snapshot.error,
          );
        });
  }

  // Password Widget
  Widget passwordField() {
    return StreamBuilder(
        stream: loginBloc.password,
        builder: (context, snapshot) {
          return EditText(
            hintText: keyString(context, "hint_enter_password"),
            isPassword: true,
            onChanged: loginBloc.passwordUpdate,
            isSecure: true,
            errorText: snapshot.error,
          );
        });
  }

  Widget signInButton() {
    return StreamBuilder<bool>(
        stream: loginBloc.submitCheck,
        builder: (contect, snapshot) {
          return ShadowButton(
            value: keyString(context, "lbl_sign_in"),
            onPressed: () {
              hideKeyboard(context);
              if (!mounted) return;
              setState(() {
                isLoading = true;

                if (snapshot.hasData) {
                  this.widget.login(loginBloc.email.toString(),
                      loginBloc.password.toString());
                } else {}

                // Call Login API Here
                // this.widget.login(usernameController.text,
                //     passwordController.text);

                // DashboardView().launch(context);
                // }
              });
            },
            isEnabled: snapshot.hasData,
          ).paddingOnly(left: 20, right: 20);
        });
  }

  @override
  Widget build(BuildContext context) {
    currentContext = context;
    return Scaffold(
      backgroundColor: ScreenBackgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: GradientPainter(),
              child: Center(
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
                                width: 200,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 120)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            // Email Widget
                            emailField(),
                            SizedBox(height: 14.0),
                            // Password Widget
                            passwordField(),
                            SizedBox(height: 14.0),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          CustomTheme(
                            child: Checkbox(
                              focusColor: primaryColor,
                              activeColor: primaryColor,
                              value: isRemember,
                              onChanged: (bool value) {
                                setState(() {
                                  isRemember = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            keyString(context, "lbl_remember_me"),
                            style: secondaryTextStyle(
                                size: k.standardFontSize,
                                color: TextPrimaryColor,
                                fontFamily: k.AppFont),
                          )
                        ],
                      ).paddingLeft(k.spacingStandard),
                      SizedBox(height: 14),
                      signInButton(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        keyString(context, "lbl_forgot_password"),
                        style: secondaryTextStyle(
                            size: k.standardFontSize,
                            color: TextPrimaryColor,
                            fontFamily: k.AppFont),
                      ).onTap(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(),
                        );
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(keyString(context, "lbl_don_t_have_an_account"),
                              style: primaryTextStyle(
                                  size: k.standardFontSize,
                                  color: TextPrimaryColor)),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: GestureDetector(
                                child: Text(keyString(context, "lbl_sign_up"),
                                    style: TextStyle(
                                        fontSize: k.standardFontSize.toDouble(),
                                        color: primaryColor,
                                        fontFamily: k.AppFont)),
                                onTap: () {
                                  // Navigate to SignUp View
                                  SignUpView().launch(context);
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
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

// ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
  var email = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    forgotPwdApi() async {
      hideKeyboard(context);
      // Create Request for Forget Password

      // Call Forget Password API
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(k.spacingControl),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration:
            boxDecoration(color: Colors.white, radius: 10.0, bgColor: White_BG),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(keyString(context, "lbl_forgot_password"),
                      style: boldTextStyle(color: TextPrimaryColor, size: 24))
                  .paddingOnly(
                      left: spacingStandardNew.toDouble(),
                      right: spacingStandardNew.toDouble(),
                      top: spacingStandardNew.toDouble()),
              SizedBox(height: spacingStandardNew.toDouble()),
              Column(
                children: [
                  EditText(
                    hintText: keyString(context, "hint_enter_email"),
                    isPassword: false,
                    mController: email,
                  ),
                ],
              ).paddingOnly(
                  left: spacingStandardNew.toDouble(),
                  right: spacingStandardNew.toDouble(),
                  bottom: spacingStandard.toDouble()),
              ShadowButton(
                value: keyString(context, "lbl_submit"),
                onPressed: () async {
                  if (email.text.isEmpty)
                    toast(keyString(context, "lbl_email_id") +
                        " " +
                        keyString(context, "lbl_field_required"));
                  else
                    forgotPwdApi();
                },
              ).paddingAll(spacingStandardNew.toDouble()),
            ],
          ),
        ),
      ),
    );
  }
}
