import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:volitionllp_task/common/app_helper.dart';
import 'package:volitionllp_task/network/helpers/api_base_helper.dart';
import 'package:volitionllp_task/products/models/products_model.dart';
import 'package:volitionllp_task/products/repository/products_repository.dart';

import 'test_data.dart';

class MockDioAdapter extends DioAdapter with Mock {
  MockDioAdapter(dio) : super(dio: dio);
}

class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  late Dio dio;
  late MockDioAdapter mockDioAdapter;
  String link = "https://fakestoreapi.com/products";

  setUp(() {
    APIBaseHelper.init();
    dio = APIBaseHelper.dio;
    mockDioAdapter = MockDioAdapter(
      dio,
    );
  });

  tearDown(() {
    APIBaseHelper.closeDio();
    mockDioAdapter.reset();
  });

  test("Products Repository Test", () async {
    APIBaseHelper.init();
    dio = APIBaseHelper.dio;
    final responsePayload = jsonEncode(TestData.jsonData);

    final mockResponse = ResponseBody.fromString(
      responsePayload,
      200,
    );

    mockDioAdapter.onGet(link, (server) {
      server.reply(
        200,
        mockResponse,
      );
    });

    final response = await dio.get(
      link,
    );

    expect(
      response.statusCode,
      200,
    );

    expect(
      AppHelper.convertToProductsModel(
        data: response.data,
      ),
      isA<List<ProductsModel?>>(),
    );
  });

  test("Products Repository Failure Test", () async {
    mockDioAdapter.onGet(link, (server) {
      server.reply(
        200,
        [],
      );
    });

    final response = await dio.get(
      link,
    );

    expect(response.data, isA<List>());

    final parsedResponse = AppHelper.convertToProductsModel(
      data: response.data,
    );
    expect(
      parsedResponse,
      isA<List<ProductsModel?>>(),
    );

    expect(parsedResponse, isEmpty);
  });

  test(
      "Test when APIBaseelper is not initialized, accessing dio sould throw Error",
      () {
    // Uninitializing ApiBaseHelper and closing dio instance
    APIBaseHelper.closeDio();

    expect(() => APIBaseHelper.dio, throwsA(isA<FlutterError>()));
  });
}
