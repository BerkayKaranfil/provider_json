import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_json/item.dart';
import 'package:provider_json/productbuy.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, Item item, widget) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Sepetteki ürün | ${item.cartCounts} |"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60.h,
              width: 100.w,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 10.h,
                      width: 100.w,
                      margin: EdgeInsets.only(bottom: 1.h),
                      padding: EdgeInsets.only(right: 3.w, left: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ürün adeti:"),
                          InkWell(
                            onTap: () {
                              item.increase();
                            },
                            child: Container(
                              height: 5.h,
                              width: 5.h,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(.7.h),
                              ),
                              child: Icon(Icons.add_shopping_cart_rounded),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.blue),
                    );
                  })),
            ),
            InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductBuy())));
            },
            child: Container(
              height: 8.h,
              width: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue
              ),
              child: Center(child: Text("Satın al", style: TextStyle(fontSize: 30),)),
            ),
          )
          ],
        ),
      );
    }));
  }
}
