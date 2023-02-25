part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  const ProductsState._();

  const factory ProductsState.initial() = Initial;
  const factory ProductsState.loading() = Loading;
  const factory ProductsState.success({
    required List<ProductsModel?> productsList,
  }) = Success;
  const factory ProductsState.failure({required String errorText}) = Failure;

  bool get isInitial => this is Initial;
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;

  ProductsState get initial => const ProductsState.initial();

  ProductsState get loading => const ProductsState.loading();

  ProductsState success({
    required List<ProductsModel?> productsList,
  }) =>
      ProductsState.success(
        productsList: productsList,
      );

  ProductsState failure({required String errorText}) => ProductsState.failure(
        errorText: errorText,
      );

  List<ProductsModel?> get productsList => maybeWhen(orElse: () {
        return [];
      }, success: ((productsList) {
        return productsList;
      }));

  String get errorText => maybeWhen(orElse: () {
        return "";
      }, failure: ((errorText) {
        return errorText;
      }));
}
