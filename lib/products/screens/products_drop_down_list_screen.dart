import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/strings.dart';
import 'package:volitionllp_task/products/cubit/products_cubit.dart';
import 'package:volitionllp_task/products/models/product_drop_down_list_screen_args.dart';
import 'package:volitionllp_task/products/repository/products_repository.dart';
import 'package:volitionllp_task/products/widgets/products_widget.dart';
import 'package:volitionllp_task/styles/colors/app_color_helper.dart';
import 'package:volitionllp_task/styles/themes/text_theme_helper.dart';

class ProductsDropDownListScreen extends StatelessWidget {
  final ProductDropDownListScreenArgs args;

  static const String tag = "ProductsDropDownListScreen";

  const ProductsDropDownListScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  44,
                  16,
                  20,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColorHelper.black,
                  ),
                ),
              ),
              if (isEmpty(args.link)) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Something went wrong while getting products",
                      style: TextThemeHelper.quickSilver_16_400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ] else ...[
                RepositoryProvider(
                  create: (context) => ProductsRepository(),
                  child: BlocProvider(
                    create: (context) => ProductsCubit(
                      RepositoryProvider.of<ProductsRepository>(context),
                    ),
                    child: ProductsWidget(
                      link: args.link,
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
