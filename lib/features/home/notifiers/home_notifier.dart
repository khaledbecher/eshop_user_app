import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/common/utils/services/remote/products_service.dart';
import 'package:eshop/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeNotifier with ChangeNotifier {
  int _categoryIndex = -1;
  int _genderIndex = -1;
  int _subCategoryIndex = -1;
  double _maximalPrice = 20000;
  bool _visibleFilter = false;
  bool _visibleGenderSelection = false;
  bool _visibleSubCategories = false;

  int get categoryIndex => _categoryIndex;

  int get genderIndex => _genderIndex;

  int get subCategoryIndex => _subCategoryIndex;

  bool get visibleFilter => _visibleFilter;

  bool get visibleSubCategories => _visibleSubCategories;

  bool get visibleGenderSelection => _visibleGenderSelection;

  double get maximalPrice => _maximalPrice;

  void toggleVisibleFilter() {
    _visibleFilter = !_visibleFilter;
    notifyListeners();
  }

  void setVisibleFilter(bool newVisibleFilter) {
    _visibleFilter = newVisibleFilter;
    notifyListeners();
  }

  void setVisibleSubcategories(bool newVisibleSubcategories) {
    _visibleSubCategories = newVisibleSubcategories;
    notifyListeners();
  }

  void setVisibleGenderSelection(bool newVisibleGenderSelection) {
    _visibleGenderSelection = newVisibleGenderSelection;
    notifyListeners();
  }

  void changeCategoryIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  void changeGenderIndex(int index) {
    _genderIndex = index;
    notifyListeners();
  }

  void changeSubCategoryIndex(int index) {
    _subCategoryIndex = index;
    notifyListeners();
  }

  void clearFilter() {
    _maximalPrice = 20000;
    _categoryIndex = -1;
    _subCategoryIndex = -1;
    _genderIndex = -1;
    notifyListeners();
  }

  void setMaxPrice(double value) {
    _maximalPrice = value;
    notifyListeners();
  }

  void resetIndexes() {
    _categoryIndex = -1;
    _subCategoryIndex = -1;
    _genderIndex = -1;
    notifyListeners();
  }

  Future<List<Product>> fetchAllProducts() async {
    final response = await ProductsService.fetchAllProducts();
    List<Product> products =
        response.map((product) => Product.fromJson(product)).toList();
    return products;
  }

  Future<List<Product>> searchProductsWithFilter(String keyword) async {
    final response = await ProductsService.searchProductsWithFilter(
      keyword: keyword,
      maxPrice: _maximalPrice,
      category:
          _categoryIndex != -1 ? AppConstants.categories[_categoryIndex] : null,
      gender: _genderIndex != -1 ? AppConstants.genders[_genderIndex] : null,
      subCategory: _subCategoryIndex != -1 && _genderIndex == -1
          ? AppConstants.subCategories[_categoryIndex][_subCategoryIndex]
          : (_subCategoryIndex != -1 && _genderIndex != -1)
          ? AppConstants.subCategories[_categoryIndex][_genderIndex]
      [_subCategoryIndex]
          : null,
    );

    List<Product> filteredProducts =
        response.map((product) => Product.fromJson(product)).toList();
    return filteredProducts;
  }

  Future<List<Product>> fetchProductsWithFilter() async {
    final response = await ProductsService.fetchProductsWithFilter(
      maxPrice: _maximalPrice,
      category:
          _categoryIndex != -1 ? AppConstants.categories[_categoryIndex] : null,
      gender: _genderIndex != -1 ? AppConstants.genders[_genderIndex] : null,
      subCategory: _subCategoryIndex != -1 && _genderIndex == -1
          ? AppConstants.subCategories[_categoryIndex][_subCategoryIndex]
          : (_subCategoryIndex != -1 && _genderIndex != -1)
              ? AppConstants.subCategories[_categoryIndex][_genderIndex]
                  [_subCategoryIndex]
              : null,
    );
    List<Product> filteredProducts =
        response.map((product) => Product.fromJson(product)).toList();
    return filteredProducts;
  }

  Future<List<Product>> fetchTopDiscounts() async {
    final response = await ProductsService.fetchProductsDiscountSort();
    List<Product> sortedProducts = response
        .map((product) => Product.fromJson(product))
        .toList()
        .getRange(0, 3)
        .toList();
    return sortedProducts;
  }

  Future<List<Product>> fetchPopular() async {
    final response = await ProductsService.fetchProductsRatingSort();
    List<Product> sortedProducts =
        response.map((product) => Product.fromJson(product)).toList();
    return sortedProducts;
  }
}
