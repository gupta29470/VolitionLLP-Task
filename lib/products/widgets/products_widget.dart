import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/strings.dart';
import 'package:volitionllp_task/common/navigation_helper.dart';
import 'package:volitionllp_task/common/route_helper.dart';
import 'package:volitionllp_task/common/extensions.dart';
import 'package:volitionllp_task/products/cubit/products_cubit.dart';
import 'package:volitionllp_task/products/models/product_detail_screen_args.dart';
import 'package:volitionllp_task/products/models/products_model.dart';
import 'package:volitionllp_task/styles/colors/app_color_helper.dart';
import 'package:volitionllp_task/styles/themes/decoration_helper.dart';
import 'package:volitionllp_task/styles/themes/text_theme_helper.dart';

part '../extensions/product_widget_ext.dart';

class ProductsWidget extends StatefulWidget {
  final String link;

  const ProductsWidget({
    super.key,
    required this.link,
  });

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  ValueNotifier<bool> expanded = ValueNotifier<bool>(false);

  @override
  void didChangeDependencies() {
    context.productsCubit.getProductsList(widget.link);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (_, state) {
        return state.maybeWhen(orElse: () {
          return Text(
            "Something went wrong while getting products",
            style: TextThemeHelper.quickSilver_16_400,
            textAlign: TextAlign.center,
          );
        }, loading: () {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: AppColorHelper.glitterLake,
              ),
            ],
          );
        }, success: (productsList) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ExpansionTile(
              initiallyExpanded: false,
              subtitle: ValueListenableBuilder<bool>(
                valueListenable: expanded,
                builder: (_, expandedValue, __) {
                  if (expandedValue) {
                    return Text(
                      "Tap to shrink",
                      style: TextThemeHelper.quickSilver_12_500,
                    );
                  } else {
                    return Text(
                      "Tap to expand",
                      style: TextThemeHelper.quickSilver_12_500,
                    );
                  }
                },
              ),
              title: Text(
                "Select Title",
                style: TextThemeHelper.black_16_700,
              ),
              onExpansionChanged: ((value) {
                expanded.value = !expanded.value;
              }),
              children: List.generate(
                productsList.length,
                (index) {
                  if (isNotEmpty(productsList[index]?.title)) {
                    return GestureDetector(
                      onTap: () {
                        navigateToProductDetailScreen(
                          productsList[index],
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: DecorationHelper.titleDropdownDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "${productsList[index]?.title}",
                                style: TextThemeHelper.white_14_700,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColorHelper.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        });
      },
    );
  }
}
