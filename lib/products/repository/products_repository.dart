import 'dart:developer';

import 'package:volitionllp_task/common/app_helper.dart';
import 'package:volitionllp_task/network/helpers/api_base_helper.dart';
import 'package:volitionllp_task/network/helpers/base_network_response.dart';
import 'package:volitionllp_task/products/models/products_model.dart';

class ProductsRepository {
  static const String tag = "ProductsRepository";

  ProductsRepository() {
    APIBaseHelper.init();
  }

  Future<List<ProductsModel?>> getProductsList(String link) async {
    try {
      BaseNetworkResponse response = await APIBaseHelper.get(
        url: link,
      );

      if (response.isSuccess() &&
          response.response?.data != null &&
          response.response?.data.isNotEmpty) {
        return AppHelper.convertToProductsModel(
          data: response.response?.data,
        );
      } else {
        log("$tag ====== ${response.httpCode}");
        return [];
      }
    } catch (error) {
      log("$tag ====== $error");
      return [];
    }
  }
}
