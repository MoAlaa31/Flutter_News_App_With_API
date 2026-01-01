import 'package:flutter/material.dart';


class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.News, required this.bordered, required this.color});
  final String News;
  final bool bordered;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      decoration: BoxDecoration(
        // color: Color(0xffFFA500),
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: bordered ? BoxBorder.all(color: Colors.black, width: 1) : null
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            News,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16
            ),
          ),
        ),
      )
    );
  }
}
