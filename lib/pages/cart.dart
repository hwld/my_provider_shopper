import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(
              height: 1,
            ),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(
              Icons.remove_circle_outline,
            ),
            onPressed: () {
              cart.remove(cart.items[index]);
            },
          ),
          title: Text(
            cart.items[index].name,
          ),
        );
      },
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Container(
        color: Colors.yellow,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<CartModel>(builder: (context, cart, child) {
                return Text(
                  '\$${cart.totalPrice}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              const SizedBox(width: 24),
              TextButton(
                onPressed: () {},
                child: const Text('Buy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
