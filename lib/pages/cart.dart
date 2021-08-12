import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(
              Icons.remove_circle_outline,
            ),
            onPressed: () {},
          ),
          title: Text('Sample'),
        );
      },
    );
  }
}

class _CartTotal extends StatelessWidget {
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
              Text('\$10000'),
              const SizedBox(width: 24),
              TextButton(
                onPressed: () {},
                child: const Text('Buy'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
