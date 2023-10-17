import 'package:flutter/material.dart';
import 'package:store_app/helpers/api_class.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category,
      //String? token
      }) async {
    print('product id = $id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
      //'id': id,
    });

    return ProductModel.fromJson(data);
  }
}
