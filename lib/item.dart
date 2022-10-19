import 'package:flutter/widgets.dart';

class Item with ChangeNotifier {
  int _cartCount;

  Item(this._cartCount);

  int get cartCounts => _cartCount;

  String get price => "${getPrice().toString()} ₺";

  set cartCounts(int value) {
    _cartCount = value;
  }

  void increase() {
    _cartCount++;
    notifyListeners();
  }

  void decrease() {
    _cartCount--;
    notifyListeners();
  }

  void reset() {
    _cartCount = 0;
    notifyListeners();
  }

  int getPrice(){
    int price = 0;
    for (var i = 0; i < basket!.length; i++) {
      price += int.parse(basket![i]["price"].toString());
    }
    return price;
  }
  
  void addBasket(Object value){
    basket!.add(value);
    notifyListeners();
  }

  void removeBasket(int index){
    basket!.removeAt(index);
    notifyListeners();
  }

  List? basket = [];

  List? products = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6b2fIwLB1t73eAh_etV1ql2qTxAZyhyi2MA&usqp=CAU",
      "title":"Samsung s22",
      "description": "ürün hakkındaki açıklama",
      "price": 89,
    },
    {
      "image":
          "https://ffo3gv1cf3ir.merlincdn.net//SiteAssets/pasaj/crop/cg/1663938725354/1-1663938713760/1-1663938713760_600x450.png",
      "title":"Iphone 14",
      "description": "ürün hakkındaki açıklama",
      "price": 122,
    },
    {
      "image":
          "https://cdn.cimri.io/image/1000x1000/xiaomi-11t-pro-5g-256gb-8gb-ram-667-inc-108mp-akilli-cep-telefonu-beyaz_499682007.jpg",
      "title":"Xiaomi 11t",
      "description": "ürün hakkındaki açıklama",
      "price": 25,
    },
  ];
}
