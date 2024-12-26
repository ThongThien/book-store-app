import 'package:book_store/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailPage extends StatefulWidget {
  final int orderID;

  const OrderDetailPage({
    super.key,
    required this.orderID,
  });

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final UserController userController = Get.put(UserController());
  late Future<List<Map<String, dynamic>>> _orderDetailsFuture;

  @override
  void initState() {
    super.initState();
    _snapshotOrderDetails();
  }

  void _snapshotOrderDetails() {
    _orderDetailsFuture = userController.getOrderDetails(widget.orderID);
  }

  Future<void> _updateStateAndRefresh(int itemId, String newState) async {
    await userController.updateState(itemId, newState);

    // Làm mới giao diện bằng cách gọi lại dữ liệu
    setState(() {
      _snapshotOrderDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _orderDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No details found.'));
          }

          final orderDetails = snapshot.data!;
          return ListView.builder(
            itemCount: orderDetails.length,
            itemBuilder: (context, index) {
              final item = orderDetails[index];
              final book = item['book'];
              final state = item['state'] ?? "Đang Giao";

              return Card(
                color: state == "Đã Hủy" ? Colors.red[100] : Colors.white,
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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quantity: ${item['quantity']}'),
                      Text('State: $state'),
                      Text('${item['price']} \$'),
                    ],
                  ),
                  trailing: state == "Đã Hủy"
                      ? null
                      : ElevatedButton(
                          onPressed: () async {
                            await _updateStateAndRefresh(item['id'], "Đã Hủy");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text("Hủy"),
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
