import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volitionllp_task/products/cubit/products_cubit.dart';

extension BuildContextX on BuildContext {
  ProductsCubit get productsCubit => read<ProductsCubit>();
}
