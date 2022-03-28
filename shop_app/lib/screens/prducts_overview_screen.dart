import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';
// import '../providers/products.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _shownOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOption selectedValue) {
                setState(() {
                  if (selectedValue == FilterOption.Favorites) {
                    // productsContainer.showFavoritesOnly();
                    _shownOnlyFavorites = true;
                  } else {
                    // productsContainer.showAll();
                    _shownOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOption.Favorites),
                    PopupMenuItem(
                        child: Text('Show All'), value: FilterOption.All),
                  ])
        ],
      ),
      body: ProductGrid(_shownOnlyFavorites),
    );
  }
}
