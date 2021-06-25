// App Model
class AppDetailModel {
  AppCategoryModel category;
  var name = "";
  var image = "";
  bool isFeatured = false;

  AppDetailModel({
    this.category,
    this.name,
    this.image,
  });
}

// Category Model
class AppCategoryModel {
  var image = "";
  var title = "";

  AppCategoryModel([this.image, this.title]);
}
