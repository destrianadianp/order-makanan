import 'package:flutter/material.dart';
import 'package:order2/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:order2/helper/location_picker.dart';
import 'package:flutter_map_location_picker/flutter_map_location_picker.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String? location;
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        double totalProductPrice = cart.cartItems.fold(0.0, (sum, item) {
          final price = item.product.price ?? 0;
          final quantity = item.quantity ?? 1;
          return sum + (price * quantity);
        });

        double handlingFee = 3000;
        double shippingFee = 15000;
        double totalPayment = totalProductPrice + handlingFee + shippingFee;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green[600],
          ),
          body: cart.cartItems.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cart.cartItems.length,
                              itemBuilder: (context, index) {
                                final item = cart.cartItems[index];
                                final price = item.product.price ?? 0;
                                final quantity = item.quantity ?? 1;
                                final totalPrice = price * quantity;

                                return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15), // Mengubah border radius ke 15
                                      child: Image.asset(
                                        item.product.productImage,
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            item.product.productName,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Rp. ${totalPrice.toStringAsFixed(0)}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove, color: Colors.red),
                                          onPressed: () {
                                            cart.minusQuantity(index);
                                          },
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text(
                                            item.quantity.toString(),
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add, color: Colors.green),
                                          onPressed: () {
                                            cart.addQuantity(index);
                                          },
                                        ), 
                                        IconButton(onPressed: (){
                                          cart.remove(item);
                                        }, icon: Icon(Icons.delete))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                              },
                            ),
                            const SizedBox(height: 5),
                            _buildSectionTitle('Alamat pengantaran', onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const LocationPickerPage()))
                                  .then((result) {
                                if (result != null) {
                                  final locationResult = result as LocationResult;
                                  setState(() {
                                    location = locationResult.completeAddress;
                                    latitude = locationResult.latitude;
                                    longitude = locationResult.longitude;
                                  });
                                }
                              });
                            }),
                            Text(location ?? "You haven't picked a location yet"),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {}, 
                                child: Row(
                                  children: const [
                                    Icon(Icons.edit),
                                    SizedBox(width: 10),
                                    Text("Isi detail alamat")
                                  ],
                                )),
                            const SizedBox(height: 20),
                            _buildSectionTitle('Ringkasan pembayaran'),
                            const SizedBox(height: 10),
                            _buildPaymentSummary(
                                totalProductPrice, handlingFee, shippingFee, totalPayment),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _buildBottomBar(totalPayment),
                    ),
                  ],
                )
              : const Center(child: Text("Your cart is empty!")),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title, {VoidCallback? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (onTap != null)
          TextButton(
            onPressed: onTap,
            child: const Text('Ganti alamat', style: TextStyle(color: Colors.blue)),
          ),
      ],
    );
  }

  Widget _buildPaymentSummary(double totalProductPrice, double handlingFee, double shippingFee, double totalPayment) {
    return Container(
      padding: const EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //   color: Colors.grey[100],
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow('Harga Produk', totalProductPrice),
          const SizedBox(height: 10),
          _buildSummaryRow('Biaya Penanganan', handlingFee),
          const SizedBox(height: 10),
          _buildSummaryRow('Biaya Pengiriman', shippingFee),
          const Divider(),
          _buildSummaryRow('Total pembayaran', totalPayment, isBold: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
        Text(
          'Rp. ${value.toStringAsFixed(0)}',
          style: TextStyle(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildBottomBar(double totalPayment) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tunai',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp. ${totalPayment.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle order confirmation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Pesan Sekarang', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
