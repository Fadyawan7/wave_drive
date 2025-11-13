import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActivityView extends StatelessWidget {
  ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFF003B73),
        elevation: 0,
        title: const Text(
          "Activity",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Column(
        children: [

          // TOP ROUNDED WHITE CONTAINER
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: Column(
              children: [
                const Gap(24),

                // Title
                const Text(
                  "Weekly Activity",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),

                const Gap(6),

                // Big Number
                const Text(
                  "0.00",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const Gap(4),

                const Text(
                  "Hours logged this week",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black38,
                  ),
                ),

                const Gap(20),

                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "View previous data",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0066CC),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                const Gap(40),
              ],
            ),
          ),

          // Floating Icon
          Center(
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF5FF),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "S",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0066CC),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const Spacer(),

          // ℹ Bottom Stats Box
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatBox(label: "Hours", value: "0"),
                _StatBox(label: "Rides", value: "0"),
                _StatBox(label: "Cancels", value: "0"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
