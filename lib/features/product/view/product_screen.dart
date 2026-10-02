import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/product/model/response_product.dart';
import 'package:shop_app/features/product/view/widgets/main_card.dart';
import 'package:shop_app/features/product/view_model/cubit.dart';
import 'package:shop_app/features/product/view_model/product_data.dart';
import 'package:shop_app/core/utils/widgets/appbar/main_app_bar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.email, required this.password});
  final String email;
  final String password;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productData = ProductData();
  ResponseProduct? responseProduct;
  bool isGridView = true;

  @override
  void initState() {
    responseProduct = productData.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: MainAppBar(
          titleAlignment: Alignment.centerLeft,
          title: 'Products',
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

            // Change cards layout
            IconButton(
              onPressed: () {
                setState(() {
                  isGridView = !isGridView;
                });
              },
              icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
            ),
          ],
        ),
        body: isGridView
            ? GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: responseProduct?.responseProductData.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final data = responseProduct?.responseProductData[index];

                  return MainCard(data: data!, isGrid: true);
                },
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: responseProduct?.responseProductData.length ?? 0,
                itemBuilder: (context, index) {
                  final data = responseProduct?.responseProductData[index];

                  return MainCard(data: data!, isGrid: false);
                },
              ),
      ),
    );
  }
}
