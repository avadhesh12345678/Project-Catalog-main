import 'package:Project_Catalog/utils/Constants.dart';

import 'AppInfo.dart';
import 'Models.dart';
import 'package:intl/intl.dart';

// Generate App Categories
List<AppCategoryModel> getAppCategories() {
  List<AppCategoryModel> list = List<AppCategoryModel>();

  var cat1 = AppCategoryModel();
  cat1.image = Bluetooth_Icon;
  cat1.title = "Bluetooth";

  var cat2 = AppCategoryModel();
  cat2.image = IOT_Icon;
  cat2.title = "IOT";

  var cat3 = AppCategoryModel();
  cat3.image = Medical_Icon;
  cat3.title = "Healthcare";

  var cat4 = AppCategoryModel();
  cat4.image = "";
  cat4.title = "4";

  var cat5 = AppCategoryModel();
  cat5.image = "";
  cat5.title = "5";

  var cat6 = AppCategoryModel();
  cat6.image = "";
  cat6.title = "6";

  var cat7 = AppCategoryModel();
  cat7.image = "";
  cat7.title = "7";

  var cat8 = AppCategoryModel();
  cat8.image = "";
  cat8.title = "8";

  var cat9 = AppCategoryModel();
  cat9.image = "";
  cat9.title = "9";

  list.add(cat1);
  list.add(cat2);
  list.add(cat3);
  list.add(cat4);
  list.add(cat5);
  list.add(cat6);
  list.add(cat7);
  list.add(cat8);
  list.add(cat9);

  return list;
}

// Generate Featured Apps

List<AppDetailModel> getFeaturedApps() {
  // ignore: deprecated_member_use
  List<AppDetailModel> listApps = List<AppDetailModel>();

  AppDetailModel app1 = AppDetailModel();
  app1.image = "scr1.jpg";
  app1.name = "App 1";
  app1.category = AppCategoryModel("image", "title");

  AppDetailModel app2 = AppDetailModel();
  app2.image = "scr2.jpg";
  app2.name = "App 2";
  app2.category = AppCategoryModel("image", "title");

  AppDetailModel app3 = AppDetailModel();
  app3.image = "scr3.jpg";
  app3.name = "App 3";
  app3.category = AppCategoryModel("image", "title");

  AppDetailModel app4 = AppDetailModel();
  app4.image = "scr4.jpg";
  app4.name = "App 4";
  app4.category = AppCategoryModel("image", "title");

  AppDetailModel app5 = AppDetailModel();
  app5.image = "scr5.jpg";
  app5.name = "App 5";
  app5.category = AppCategoryModel("image", "title");

  AppDetailModel app6 = AppDetailModel();
  app6.image = "scr6.jpg";
  app6.name = "App 6";
  app6.category = AppCategoryModel("image", "title");

  listApps.add(app1);
  listApps.add(app2);
  listApps.add(app3);
  listApps.add(app4);
  listApps.add(app5);
  listApps.add(app6);

  return listApps;
}

// List<AppInfo> finalApps() {
//   List<AppInfo> list = List<AppInfo>();

//   VendorInfo vendor1 = VendorInfo();
//   vendor1.name = 'Georg Fischer AG';
//   vendor1.website = 'www.google.com';

//   DateFormat dateFormat = DateFormat("MMM d, yyyy");

//   AppInfo app1 = AppInfo();
//   app1.name = 'GF Config Tool';
//   app1.version = '2.1';
//   app1.venderInfo = vendor1;
//   app1.createdDate = dateFormat.parse('May 11, 2019');
//   app1.updatedDate = dateFormat.parse('Oct 19, 2020');
//   app1.overview =
//       'GF Piping Systems Configuration Tool allows users to configure their Signet 2580 FlowtraMag meter to the parameters required for their system. Users can change the flow unit, totalizer unit, averaging, sensitivity, low flow cut off, span the 4 to 20 mA output, and monitor the FlowtraMag on their iOS device.';
//   app1.launchImagePath = '';
//   app1.supportedPlatforms = [PlatformInfo(name: 'iOS',
//   appLogoPath: '',
//   compatibility: '',
//   storeLink: '')]

//   // String name;
//   // String version;
//   // dynamic venderInfo;
//   // DateTime createdDate;
//   // DateTime updatedDate;
//   // String overview;
//   // String launchImagePath;
//   // List<PlatformInfo> supportedPlatforms;
//   // AppCategory category;
//   // List<String> subCategoryLabels;
//   // bool isFeatured;
//   // double rating;
//   // List<ScreenInfo> screens;
// }
