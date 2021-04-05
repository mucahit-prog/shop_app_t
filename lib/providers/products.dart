import 'package:flutter/material.dart';
import 'product.dart';

// arada güçlü bir ilişki kurulmak isteniyorsa extends kullanırız. Ama zayıf bir ilişki
// tercih ediliyorsa o zaman with kullanırız. with birden fazla kullanabiliriz ama
// extends sadece bir kere kullanılır bir class üzerinde.

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A blue cloth - it is pretty',
      price: 10.00,
      imageUrl:
          'https://cdn11.bigcommerce.com/s-l8qlnhq2eh/products/4373/images/10086/microfiber-cloth-wiping-cuvettes-hi731318__00078.1570299623.1280.1280.jpg?c=2',
    ),
    Product(
      id: 'p2',
      title: 'Red Cloth',
      description: 'A white cloth - it is pretty',
      price: 10.00,
      imageUrl:
          'https://cdn11.bigcommerce.com/s-l8qlnhq2eh/products/4373/images/10086/microfiber-cloth-wiping-cuvettes-hi731318__00078.1570299623.1280.1280.jpg?c=2',
    ),
    Product(
      id: 'p3',
      title: 'Blue Cloth',
      description: 'A blue cloth - it is pretty',
      price: 10.00,
      imageUrl:
          'https://cdn11.bigcommerce.com/s-l8qlnhq2eh/products/4373/images/10086/microfiber-cloth-wiping-cuvettes-hi731318__00078.1570299623.1280.1280.jpg?c=2',
    ),
    Product(
      id: 'p4',
      title: 'White Cloth',
      description: 'A white cloth - it is pretty',
      price: 10.00,
      imageUrl:
          'https://cdn11.bigcommerce.com/s-l8qlnhq2eh/products/4373/images/10086/microfiber-cloth-wiping-cuvettes-hi731318__00078.1570299623.1280.1280.jpg?c=2',
    ),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // sayet showFavoritesOnly true ise _itemdeki listelenmiş olan ürünlerden sadece 
    // favorilenmiş itemleri getir.
    // if(_showFavoritesOnly){
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    // _items listinin hepsini alır.
    return [..._items];
  }

  List<Product> get favoriteItems{
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  // void showFavoritesOnly(){
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll(){
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
