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
       // item.price = "${item.getPrice().toString()} TL";
        return Scaffold(
          appBar: AppBar(title: Text("Sepetteki ürün | ${item.basket!.length} |")),
          body: Stack(
            children: [
              item.basket!.isEmpty ? Center(child: Text("Sepetiniz Boş", style: TextStyle(fontSize: 30),)):
              ListView.builder(
                itemCount: item.basket!.length,
                itemBuilder: ((context, index) {
                return Container(
                      width: 100.w,
                      height: 8.h,
                      margin: EdgeInsets.only(bottom: 1.h),
                      padding: EdgeInsets.only(right: 3.w, left: 3.w),
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.w),
                                child: SizedBox(
                                  width: 7.w,
                                  height: 7.h,
                                  child: Image.network("${item.basket![index]["image"]}"),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("${item.basket![index]["title"]}",style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              item.removeBasket(index);
                            },
                            child: Container(
                              width: 4.h,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(.7.h)),
                              child: Icon(Icons.close),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.blue),
                    );
              })),
              Positioned(
                bottom: 2.h,
                child: Container(
                  width: 92.w,
                  height: 8.h,
                  padding: EdgeInsets.only(left: 4.w),
                  child: Row(
                    children: [
                      Text(
                        "Ürün Fiyat Toplamı : ${item.price}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 4.w, right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2.w)),
                )),
              
            ],
          )
          /* Column(
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
         */);
      },
    );
  }
}
