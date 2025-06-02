import 'package:assignment/widgets/coupen_card.dart';
import 'package:assignment/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AllCouponsScreen extends StatelessWidget {
  const AllCouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'All Offers',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CouponCard(
            icon: Icons.account_balance,
            title: "Extra ₹100 off on SBI",
            subtitle: "Applicable on SBI Credit card",
            footer: "No code required",
            onTap: () {},
          ),
          const SizedBox(height: 10),
          CouponCard(
            icon: Icons.percent,
            title: "Get flat 15% off",
            subtitle: "On all electronics",
            footer: "Use Coupon XYZ15",
            onTap: () {},
          ),
          // Add more CouponCards here
        ],
      ),
    );
  }
}
