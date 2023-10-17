import 'dart:convert';

import 'package:store_app/helpers/api_class.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllCatogeries
{
  Future<List<ProductModel>> getAllCategories({required String categoryName}) async
  {
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> productList = [];

      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }

      return productList;
  }
}