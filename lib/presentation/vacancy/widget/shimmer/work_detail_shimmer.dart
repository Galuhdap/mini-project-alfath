import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WorkDetailShimmer extends StatelessWidget {
  const WorkDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🟦 Bagian Header (Logo + Nama Pekerjaan + Nama Perusahaan)
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bar(width: 160, height: 14),
                    const SizedBox(height: 6),
                    _bar(width: 100, height: 12),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 1, color: Color(0xFFE0E0E0)),
            const SizedBox(height: 8),

            // 🕒 Row posting info & status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _bar(width: 60, height: 12),
                    const SizedBox(width: 8),
                    _bar(width: 80, height: 12),
                  ],
                ),
                Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 🧾 Deskripsi pekerjaan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bar(width: double.infinity, height: 12),
                const SizedBox(height: 8),
                _bar(width: double.infinity, height: 12),
                const SizedBox(height: 8),
                _bar(width: 250, height: 12),
                const SizedBox(height: 16),
                _bar(width: double.infinity, height: 12),
                const SizedBox(height: 8),
                _bar(width: double.infinity, height: 12),
                const SizedBox(height: 8),
                _bar(width: 180, height: 12),
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
}
