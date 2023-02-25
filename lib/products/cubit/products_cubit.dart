import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:volitionllp_task/products/models/products_model.dart';
import 'package:volitionllp_task/products/repository/products_repository.dart';

part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsCubit(this._productsRepository)
      : super(
          const ProductsState.initial(),
        );

  Future<void> getProductsList(String link) async {
    emit(const ProductsState.loading());
    try {
      List<ProductsModel?> productsList =
          await _productsRepository.getProductsList(link);

      if (productsList.isNotEmpty) {
        emit(
          ProductsState.success(
            productsList: productsList,
          ),
        );
      } else {
        emit(
          const ProductsState.failure(
              errorText: "Something went wrong while get stock scan data"),
        );
      }
    } catch (error) {
      emit(
        ProductsState.failure(errorText: "$error"),
      );
    }
  }
}
