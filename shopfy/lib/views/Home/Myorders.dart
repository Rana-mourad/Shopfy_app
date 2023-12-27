import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  final List<Order> orders;

  MyOrdersPage({required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body: orders.isEmpty
          ? Center(
              child: Text("No orders available."),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                Order order = orders[index];
                return OrderItemCard(order: order);
              },
            ),
    );
  }
}

class OrderItemCard extends StatelessWidget {
  final Order order;

  OrderItemCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text("Order ID: ${order.orderId}"),
        subtitle: Text("Total: \$${order.totalAmount.toStringAsFixed(2)}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailsPage(order: order),
            ),
          );
        },
      ),
    );
  }
}

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  OrderDetailsPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Order ID: ${order.orderId}"),
          ),
        ],
      ),
    );
  }
}

class Order {
  final String orderId;
  final double totalAmount;

  Order({required this.orderId, required this.totalAmount});
}
