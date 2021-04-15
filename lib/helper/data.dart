import "package:flutter_news/models/catergory_models.dart";
import 'package:flutter_news/constants.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  CategoryModel categoryModel;
  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imgURL = kBusinessImgUrl;
  categories.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imgURL = kEntertainmentImgUrl;
  categories.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imgURL = kGeneralImgUrl;
  categories.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imgURL = kHealthImgUrl;
  categories.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imgURL = kTechnologyImgUrl;
  categories.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imgURL = kScienceImgUrl;
  categories.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imgURL = kSportsImgUrl;
  categories.add(categoryModel);

  return categories;
}
