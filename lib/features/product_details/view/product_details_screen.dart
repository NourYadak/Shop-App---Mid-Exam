import 'package:shop_app/core/utils/widgets/appbar/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/product/model/response_product_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.data});

  final ResponseProductData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Product Details', 
      actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],),
     

      backgroundColor: Colors.white,
     
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  data.productImage ?? '', // ضع رابط/مسار صورة الحقيبة هنا
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),

            
             Text(
               data.productName ?? 'Nothing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),

            
             Text(
              '\$${data.productPrice}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),

            // 4. وصف المنتج
             Text(
              data.productDescription ?? 'No description available.', 
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),

            _buildDetailRow('Brand', data.productBrand ?? 'Unknown'),
            const Divider(color: Color(0xFFEEEEEE), thickness: 1, height: 20),
            
            _buildDetailRow('Category', data.productCategory ?? 'Unknown'),
            const Divider(color: Color(0xFFEEEEEE), thickness: 1, height: 20),
            
             _buildDetailRowStock(
  'In Stock',
  Text(
    data.productStock! > 0 ? 'Yes' : 'No',
    style: TextStyle(
      color: data.productStock! > 0
          ? Colors.green
          : Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
),
         
           
        
            const Divider(color: Color(0xFFEEEEEE), thickness: 1, height: 20),
            
            _buildDetailRow('Rating', data.productRating ?.toString() ?? '0'),
           
           
        
            const SizedBox(height: 30),

            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

   Widget _buildDetailRowStock(String title, Widget value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
      
          value,
         
        
      ],
    );
  }

  String InStock() {
    if(data.productStock! > 0) {
      return "Yes";
    }
    else{
      return "No";
    }
  
  }
}