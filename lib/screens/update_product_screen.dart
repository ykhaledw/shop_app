import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({super.key});

  static String id = 'Update Product';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? newName, newDesc, newImage, newPrice;

  bool isLoading = false;

  //ProductModel productUpdate;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update ${product.title}',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomText(
                  hintText: 'New Name',
                  onChanged: (data) {
                    newName = data;
                  },
                ),
                CustomText(
                  hintText: 'New Description',
                  onChanged: (data) {
                    newDesc = data;
                  },
                ),
                CustomText(
                  hintText: 'New Price',
                  textType: TextInputType.number,
                  onChanged: (data) {
                    newPrice = data;
                  },
                ),
                CustomText(
                  hintText: 'New Image',
                  onChanged: (data) {
                    newImage = data;
                  },
                ),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct(product);
                      print('Success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: newName == null ? product.title : newName!,
      price: newPrice == null ? product.price.toString() : newPrice!,
      desc: newDesc == null ? product.description : newDesc!,
      image: newImage == null ? product.image : newImage!,
      category: product.category,
    );
  }
}
