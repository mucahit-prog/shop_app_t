import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  late final String? id;
  late final String? title;
  late final String? description;
  late final double? price;
  late final String? imageUrl;
  late bool isFavorite;

  Product({this.id, this.title,this.description,this.price,this.imageUrl, this.isFavorite = false,});

  void toggleFavoriteStatus(){
    // sondaki ünlem işareti null olamayacağını belirtirken
    // baştaki ise true ise false durumunu getirmesi için var. Yani değerin 'değili' alınır.
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
