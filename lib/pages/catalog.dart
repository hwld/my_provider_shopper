import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  const _AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text('Add'),
    );
  }
}

class _ListItem extends StatelessWidget {
  final int index;

  const _ListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Expanded(child: Text('Item $index')),
            const SizedBox(width: 24),
            _AddButton(),
          ],
        ),
      ),
    );
  }
}
