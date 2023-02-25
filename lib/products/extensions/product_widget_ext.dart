part of '../widgets/products_widget.dart';

extension on _ProductsWidgetState {
  void navigateToProductDetailScreen(
    ProductsModel? productsModel,
  ) {
    NavigationHelper.navigateToRoute(
      context,
      RouteHelper.productDetailScr,
      ProductDetailScreenArgs(
        productsModel: productsModel,
      ),
    );
  }
}
