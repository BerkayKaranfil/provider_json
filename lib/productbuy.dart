import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider_json/item.dart';

class ProductBuy extends StatefulWidget {
  const ProductBuy({super.key});

  @override
  State<ProductBuy> createState() => _ProductBuyState();
}

class _ProductBuyState extends State<ProductBuy> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, Item item, widget) {
        return Scaffold(
          appBar: AppBar(title: Text("Sepetteki ürün | ${item.cartCounts} |")),
          body: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: InkWell(
                  onTap: () {
                    item.reset();
                  },
                  child: Container(
                    height: 8.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // ignore: prefer_const_constructors
                    child: Center(
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Sıfırla",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
