import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'product_item.dart';

//1. Pizzanızın hazır olduğunu söyleyen zil (Notifier: Bir şeylerin değiştiğini haber verir.)
//2. Pizzanızı size getiren garson (Provider: Değişen dataya erişiminizi sağlar.)
//3. Pizzayı yiyen siz (Consumer: Datayı isteyen ve kullanan widget)

// ********************************************************************* //
//Notifier, sizin state'inizin tutulduğu yer. Datanızı ve datanızı manipüle eden 
//class'ları burada tutuyorsunuz. Provider ile yukarıdaki Cart örneğindeki gibi 
//bu state'i widget tree'deki istediğiniz yere bağlayıp child'ların erişimine açıyorsunuz. 
//En sonunda bu state'i kullanan ve gereken metotları çağıran widget'ler Consumer'ler oluyor.

class ProductsGrid extends StatelessWidget {

  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(5.0),
      // ne kadar item geleceğini belirtir.
      itemCount: products.length,
      // ctx = context içeriğini ve i = sayaç bize döndürür.
      // örnek olarak ilke satırın contexti sayaç 1 de gelecek itemleri aşağıda sıralıyoruz.
      // bunu her bir context ve sayaç için yaıyoruz.
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
          // products[i].id,
          // products[i].title,
          // products[i].imageUrl,
        ),
      ),
      // itemlerin kendi aralarındaki boşluklarını ve bir satırda ne kadar itemin
      // yer alacağı gibi bilgileri girebiliriz buraya.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
    );
  }
}
