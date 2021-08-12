import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';
import 'package:provider_shopper/models/catalog.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _ListItem(index);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Text(
        'Catalog',
      ),
      floating: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              final cart = context.read<CartModel>();
              cart.add(item);
            },
      child: isInCart
          ? const Icon(
              Icons.check,
              semanticLabel: 'ADDED',
            )
          : const Text('Add'),
    );
  }
}

class _ListItem extends StatelessWidget {
  final int index;

  const _ListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name),
            ),
            const SizedBox(width: 24),
            _AddButton(
              item: item,
            ),
          ],
        ),
      ),
    );
  }
}
