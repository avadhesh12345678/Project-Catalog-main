import 'dart:core';

class AppInfo {
  String name;
  String version;
  VendorInfo venderInfo;
  DateTime createdDate;
  DateTime updatedDate;
  String overview;
  String launchImagePath;
  List<PlatformInfo> supportedPlatforms;
  AppCategory category;
  List<String> subCategoryLabels;
  bool isFeatured;
  double rating;
  List<ScreenInfo> screens;
}

class VendorInfo {
  String name;
  String website;
}

class PlatformInfo {
  String name;
  String storeLink;
  String appLogoPath;
  List<String> compatibility;
  PlatformInfo({
    this.name,
    this.storeLink,
    this.appLogoPath,
    this.compatibility,
  });
}

class AppCategory {
  String name;
  String logo;
  List<AppInfo> applications;
}

class ScreenInfo {
  String name;
  String overview;
  Map<String, String> supportedDevicesScreenPath;
}
