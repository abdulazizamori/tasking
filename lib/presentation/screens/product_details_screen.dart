import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/data/model/ecommerce-model.dart';
import 'package:tasking/presentation/widgets/custom_product_datails.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.ecommerceModel});
    final EcommerceModel ecommerceModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Product Details',
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: CustomProductDatails(ecommerceModel: widget.ecommerceModel,),
    );
  }
}
