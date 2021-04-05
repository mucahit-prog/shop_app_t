import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(5.0),
      // ne kadar item geleceğini belirtir.
      itemCount: products.length,
      // ctx = context içeriğini ve i = sayaç bize döndürür.
      // örnek olarak ilke satırın contexti sayaç 1 de gelecek itemleri aşağıda sıralıyoruz.
      // bunu her bir context ve sayaç için yaıyoruz.
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (context) => products[i],
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
