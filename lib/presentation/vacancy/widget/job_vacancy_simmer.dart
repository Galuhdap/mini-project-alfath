import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardJobVacancyShimmerWidget extends StatelessWidget {
  const CardJobVacancyShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Bar atas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bar(width: 120, height: 16),
                _bar(width: 70, height: 16),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
            const SizedBox(height: 8),

            // Logo + teks
            Row(
              children: [
                _circle(size: 28),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bar(width: 140, height: 14),
                    const SizedBox(height: 6),
                    _bar(width: 100, height: 12),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Bar bawah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bar(width: 100, height: 12),
                _bar(width: 60, height: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bar({required double width, required double height}) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(8),
    ),
  );

  Widget _circle({required double size}) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
  );
}
