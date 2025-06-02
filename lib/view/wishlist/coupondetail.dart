import 'package:assignment/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CouponDetailScreen extends StatelessWidget {
  final String title;

  const CouponDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget('Coupen Detail', showBackButton: true),
      // appBar: AppBar(title: const Text('Coupon Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const Gap(20),
            const Text(
              'What is the offer duration?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Text(
              '26th April - 31st May',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const Gap(10),
            const Text(
              'What are the eligibility conditions?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Offer is applicable only once during the offer period \nOffer is not applicable in case cancellations/returns/partial cancellation of order. \nDiscount will be applicable on Furniture with select sellers \nOffer is applicable subject to pincode serviceability.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
