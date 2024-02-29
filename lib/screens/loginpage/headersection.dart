import 'package:aldmictest/widgets/stylewidgets.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, required this.subtitle});
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset('assets/unnamed-removebg-preview.png',
            width: 160, height: 160),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: globalTitle(20, Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              subtitle,
              style: globalSubTitle(16, Colors.white60),
            ),
          ],
        )
      ],
    );
  }
}
