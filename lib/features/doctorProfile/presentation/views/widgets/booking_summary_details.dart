import 'package:flutter/material.dart';
import 'package:smart_tumour_detector/core/utils/constant.dart';

class BookingSummarySection extends StatelessWidget {
  const BookingSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: ConstantColor.kprimaryBlue, thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: ConstantColor.kprimaryBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text('Month 24, Year',
                          style: ConstantText.textstyle14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ConstantColor.kprimaryWhite,
                          )),
                    ),
                    const SizedBox(height: 6),
                    Text('WED, 10:00 AM',
                        style: ConstantText.textstyle12.copyWith(
                          color: ConstantColor.kprimaryBlue,
                        )),
                  ],
                ),
              ),
              const IconCircleButton(icon: Icons.check),
              const SizedBox(width: 8),
              const IconCircleButton(icon: Icons.close),
            ],
          ),
        ),
        Divider(color: ConstantColor.kprimaryBlue, thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              summaryRow("Booking For", "Another Person"),
              summaryRow("Full Name", "Jane Doe"),
              summaryRow("Age", "30"),
              summaryRow("Gender", "Female"),
            ],
          ),
        ),
        Divider(color: ConstantColor.kprimaryBlue, thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Text(
            'Problem',
            style: ConstantText.textstyle12,
          ),
        ),
      ],
    );
  }

  Widget summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: ConstantText.textstyle12,
          ),
        ],
      ),
    );
  }
}

class IconCircleButton extends StatelessWidget {
  final IconData icon;

  const IconCircleButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ConstantColor.kprimaryBlue,
      radius: 20,
      child: Icon(icon, color: ConstantColor.kprimaryWhite),
    );
  }
}
