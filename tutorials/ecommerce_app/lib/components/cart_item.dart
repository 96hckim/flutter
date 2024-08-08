import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Shoe shoe;

  const CartItem({super.key, required this.shoe});

  void removeItemFromCart(BuildContext context) {
    Provider.of<Cart>(context, listen: false).removeFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(shoe.imagePath),
        title: Text(shoe.name),
        subtitle: Text('\$${shoe.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => removeItemFromCart(context),
        ),
      ),
    );
  }
}
