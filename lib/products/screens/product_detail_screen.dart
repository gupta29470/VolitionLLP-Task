import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quiver/strings.dart';
import 'package:volitionllp_task/products/models/product_detail_screen_args.dart';
import 'package:volitionllp_task/products/models/products_model.dart';
import 'package:volitionllp_task/styles/colors/app_color_helper.dart';
import 'package:volitionllp_task/styles/themes/text_theme_helper.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String tag = "ProductDetailScreen";

  final ProductDetailScreenArgs args;

  const ProductDetailScreen({
    super.key,
    required this.args,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductsModel? productsModel;

  @override
  void initState() {
    super.initState();
    productsModel = widget.args.productsModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productsModel == null
          ? Center(
              child: Text(
                "Something went wrong while getting product details",
                style: TextThemeHelper.quickSilver_16_400,
                textAlign: TextAlign.center,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      52,
                      16,
                      28,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColorHelper.black,
                      ),
                    ),
                  ),
                  if (isNotEmpty(productsModel?.image)) ...[
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 28,
                      ),
                      child: Image.network(
                        productsModel?.image ?? "",
                        fit: BoxFit.contain,
                        height: 350,
                        width: double.infinity,
                      ),
                    )
                  ],
                  if (isNotEmpty(productsModel?.title)) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        0,
                        16,
                        16,
                      ),
                      child: Text(
                        "${productsModel?.title}",
                        style: TextThemeHelper.black_20_700,
                      ),
                    )
                  ],
                  if (productsModel?.rating?.rate != null) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        0,
                        16,
                        24,
                      ),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: productsModel?.rating?.rate ?? 1,
                            minRating: 1,
                            itemSize: 24,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            unratedColor: AppColorHelper.quickSilver,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (_) {},
                          ),
                          if (productsModel?.rating?.count != null) ...[
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              "by ${productsModel?.rating?.count} customers",
                              style: TextThemeHelper.quickSilver_12_500,
                            )
                          ],
                        ],
                      ),
                    ),
                  ],
                  if (productsModel?.price != null) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        0,
                        16,
                        24,
                      ),
                      child: Text(
                        "\$${productsModel?.price}",
                        style: TextThemeHelper.glitterLake_20_700,
                      ),
                    )
                  ],
                  if (isNotEmpty(productsModel?.description)) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        0,
                        16,
                        24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Description",
                            style: TextThemeHelper.black_16_700,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "${productsModel?.description}",
                            style: TextThemeHelper.quickSilver_16_400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
    );
  }
}
