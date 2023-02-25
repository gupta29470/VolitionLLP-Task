import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:volitionllp_task/common/app_helper.dart';
import 'package:volitionllp_task/products/cubit/products_cubit.dart';
import 'package:volitionllp_task/products/models/products_model.dart';
import 'package:volitionllp_task/products/repository/products_repository.dart';

import 'test_data.dart';

class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  late ProductsCubit productsCubit;
  late MockProductsRepository mockproductsRepository;
  String link = "https://fakestoreapi.com/products";

  void arrangeProductsRepository({
    required List<Map<String, Object>> jsonData,
  }) {
    return when(() => mockproductsRepository.getProductsList(link))
        .thenAnswer((_) async {
      return AppHelper.convertToProductsModel(
        data: jsonData,
      );
    });
  }

  setUp(() {
    mockproductsRepository = MockProductsRepository();
    productsCubit = ProductsCubit(mockproductsRepository);
  });

  test("Check loading and Success State", () async {
    arrangeProductsRepository(
      jsonData: TestData.jsonData,
    );

    final future = productsCubit.getProductsList(link);

    expect(
      productsCubit.state.loading,
      const ProductsState.loading(),
    );

    expect(
      productsCubit.state.productsList,
      [],
    );

    await future;

    expect(
      productsCubit.state.success(
        productsList: productsCubit.state.productsList,
      ),
      ProductsState.success(
        productsList: productsCubit.state.productsList,
      ),
    );

    expect(
      productsCubit.state.productsList,
      isA<List<ProductsModel?>>(),
    );
  });

  test("Check loading and Failure State", () async {
    arrangeProductsRepository(
      jsonData: [],
    );

    final future = productsCubit.getProductsList(link);

    expect(
      productsCubit.state.loading,
      const ProductsState.loading(),
    );

    expect(
      productsCubit.state.productsList,
      [],
    );

    await future;

    expect(
      productsCubit.state.failure(
        errorText: productsCubit.state.errorText,
      ),
      ProductsState.failure(
        errorText: productsCubit.state.errorText,
      ),
    );

    expect(
      productsCubit.state.productsList,
      isA<List>(),
    );
  });
}
