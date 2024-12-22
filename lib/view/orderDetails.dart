import 'package:book_store/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrderDetailPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  late final int orderID;

  OrderDetailPage({
    required this.orderID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order details"),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: userController.getOrderDetails(orderID),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No details found.'));
            }
            final orderDetails = snapshot.data!;
            return ListView.builder(
              itemCount: orderDetails.length,
              itemBuilder: (context, index) {
                final item = orderDetails[index];
                final book = item['book'];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.network(
                      book['image'] ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(book['nameBook']),
                    subtitle: Text('Quantity: ${item['quantity']}'),
                    trailing: Text('${item['price']} \$'),
                  ),
                );
              },
            );
          },
        ));
  }
}
