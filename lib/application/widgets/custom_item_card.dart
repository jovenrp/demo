import 'package:flutter/material.dart';
import 'package:nrd/features/dashboard/data/models/product_model.dart';

import '../utils/app_colors.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Container(
            padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      child: Text(
                        "${product.title}",
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        "\$${product.price}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _SubtitleIcon(product: product.rating.toString(), iconData: Icons.star_rate_rounded, hasIcon: true,),
                    const SizedBox(width: 5,),
                    _SubtitleIcon(product: product.stock.toString(), iconData: Icons.shopping_cart_rounded, hasIcon: true,),
                    const SizedBox(width: 5,),
                    _SubtitleIcon(product: product.brand.toString(), iconData: Icons.shopping_cart_rounded, hasIcon: false,),
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 200,
                  child: Text(
                    "${product.description}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: CircleAvatar(
            radius: 70.0,
            backgroundImage: NetworkImage(
                product.thumbnail ?? 'https://via.placeholder.com/150'),
            backgroundColor: AppColors.lightText,
          ),
        ),
      ],
    );
  }
}

class _SubtitleIcon extends StatelessWidget {
  const _SubtitleIcon({super.key, required this.product, this.iconData, this.hasIcon = true,});

  final String product;
  final bool hasIcon;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.disabledButton,
      ),
      child: Row(
        children: <Widget>[
          hasIcon ? const SizedBox(
            width: 0,
          ) : const SizedBox(
            width: 3,
          ),
          hasIcon ? Icon(
            iconData ?? Icons.star_rate_rounded,
            color: AppColors.warningOrange,
            size: 14,
          ) : const SizedBox(),
          Text(
            product,
            style: const TextStyle(fontSize: 10, color: AppColors.tertiary),
          ),
          const SizedBox(
            width: 3,
          ),
        ],
      ),
    );
  }
}
