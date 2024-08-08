import 'package:ecommerce_app/components/cart_item.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: cart.getCart().length,
                itemBuilder: (context, index) {
                  final shoe = cart.getCart()[index];
                  return CartItem(shoe: shoe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
