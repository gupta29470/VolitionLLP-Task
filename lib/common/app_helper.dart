import 'package:volitionllp_task/products/models/products_model.dart';

class AppHelper {
  static List<ProductsModel?> convertToProductsModel({
    dynamic data,
  }) {
    List<ProductsModel?> productList = [];

    if (data != null) {
      for (int index = 0; index < data.length; index++) {
        ProductsModel model = ProductsModel.fromJson(data[index]);

        productList.add(model);
      }
    }

    return productList;
  }
}
