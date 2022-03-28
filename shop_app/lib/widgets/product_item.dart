import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String titile;
  final String ImageUrl;

  ProductItem(this.id, this.titile, this.ImageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        ImageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        title: Text(
          titile,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
    );
  }
}
