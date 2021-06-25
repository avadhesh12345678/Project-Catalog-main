import 'package:Project_Catalog/Models/Models.dart';
import 'package:Project_Catalog/Models/TempDataGenerator.dart';
import 'package:Project_Catalog/NetworkUtil/APIHandler.dart';
import 'package:flutter/material.dart';
import 'package:Project_Catalog/utils/Constants.dart';
import 'package:Project_Catalog/utils/Colors.dart';
import 'package:Project_Catalog/utils/DashboardWidget.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:Project_Catalog/utils/app_widget.dart';

class HomeView extends StatefulWidget {
  final Welcome loginData;
  HomeView({this.loginData});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Properties
  List<AppDetailModel> listFeaturedApps;
  List<AppCategoryModel> listAppCategories;

  @override
  void initState() {
    super.initState();
    listFeaturedApps = getFeaturedApps();
    listAppCategories = getAppCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ProfileHeader(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(
                  Featured_Title,
                  fontFamily: AppFont,
                  fontSize: standardFontSizeDash,
                  fontWeight: FontWeight.bold,
                ),
                text(See_All_Apps,
                    textColor: textColor,
                    textAllCaps: true,
                    fontFamily: AppFont,
                    fontWeight: FontWeight.bold)
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listFeaturedApps.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FeaturedAppView(listFeaturedApps[index], index);
              },
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 16, top: 0),
              child: text(App_Categories,
                  fontSize: standardFontSizeDash, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listAppCategories.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return AppCategoryView(listAppCategories[index], index);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FeaturedAppView extends StatelessWidget {
  AppDetailModel model;

  FeaturedAppView(AppDetailModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: 100,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  height: 245,
                  width: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.topLeft,
                      image: new AssetImage(model.image),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(model.name,
                    fontFamily: AppFont,
                    fontWeight: FontWeight.normal,
                    isLongText: true,
                    maxLine: 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class AppCategoryView extends StatelessWidget {
  AppCategoryModel model;

  AppCategoryView(AppCategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                decoration: boxDecoration(bgColor: White_BG, radius: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    model.image,
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                  margin: EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: text(model.title)),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFont,
                        color: Colors.black),
                  ),
                  Text(
                    'John Travolta',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFont,
                        color: Colors.black),
                  )
                ],
              ),
              Spacer(),
              InkWell(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: 28),
                ),
                onTap: () {
                  // Navigate to Profile Page
                },
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 0, right: 0),
              padding: EdgeInsets.only(left: 8, right: 8),
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey[300], width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'explore apps',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      fontFamily: AppFont,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              // Navigate to Search All Page
            },
          )
        ],
      ),
    );
  }
}
