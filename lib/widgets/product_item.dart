import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // late final String? id;
  // late final String? title;
  // late final String? imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // lsiten özelliğini kapatarak widgetin dinlenmesini kapatmış oluyoruz.
    // eğer listen: false özelliğini aktif etseydik bu widgettaki özelliklerin hiç
    // biri dinamik olarak yönetilemeyecektir. mesela favorite butonuna tıkladığınızda çalışmayacak 
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // eğer hareketlilik var ise gridtile üzerinde algılamasını sağlattırcaz gesture ile.
        // ontap ile tıklandığında olacak olan olayı ayarlayacağız.
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),
          title: Text(
            product.title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
