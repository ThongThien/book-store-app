import 'package:flutter/material.dart';
import '../controller/user_controller.dart';

class OrderDetailPage extends StatefulWidget {
  final int orderId;

  const OrderDetailPage({super.key, required this.orderId});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final UserController _controller = UserController();
  late Future<List<Map<String, dynamic>>> _orderDetails;

  @override
  void initState() {
    super.initState();
    _orderDetails = _controller.getOrderDetails(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _orderDetails,
        builder: (context, snapshot) {
          final orderItems = snapshot.data!;
          return ListView.builder(
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              final item = orderItems[index];
              final book = item['book'];

              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  leading: Image.network(
                    book['image'] ?? 'https://via.placeholder.com/150',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    book['nameBook'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Author: ${book['author']}\n'
                    'Publisher: ${book['publisher']}\n'
                    'Price: ${book['price']} VND',
                  ),
                  trailing: Text('Quantity: ${item['quantity']}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
