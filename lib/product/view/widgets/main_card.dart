import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_app/product/model/response_product_data.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/product_details/view/product_details_screen.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.data, this.isGrid = false});
  final ResponseProductData data;
  final bool isGrid;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: () {
       Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ProductDetailsScreen(
        data: data,
      ),
    ),
  );
      },
     child: isGrid
    ? Card(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140,
              width: double.infinity,
          
              child: 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  data.productImage ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.error,
                        size: 30,
                      ),
                    );
                  },
                ),
              ),
            
            ),

            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.productName ?? 'Nothing',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    '\$${data.productPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    : Card(
        margin: const EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Row(
          children: [
            Image.asset(
              data.productImage ?? '',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.error),
                );
              },
            ),

            const SizedBox(width: 30),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.productName ?? 'Nothing',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
          
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    '\$${data.productPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),

            const SizedBox(width: 12),
          ],
        ),
      ),);}}