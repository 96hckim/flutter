import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  void addShoeToCart(BuildContext context, Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Column(
        children: [
          _buildSearchBar(),
          _buildTagline(),
          _buildSectionTitle(),
          const SizedBox(height: 10),
          _buildShoeList(cart),
          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Divider(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Search',
            style: TextStyle(color: Colors.grey),
          ),
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildTagline() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Text(
        'everyone flies.. some fly longer than others',
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Hot Picks 🔥',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShoeList(Cart cart) {
    return Expanded(
      child: ListView.builder(
        itemCount: cart.getShoeShop().length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final shoe = cart.getShoeShop()[index];
          return ShoeTile(
            shoe: shoe,
            onTap: () => addShoeToCart(context, shoe),
          );
        },
      ),
    );
  }
}
