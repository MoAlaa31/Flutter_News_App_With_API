import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.image,
    required this.news,
    required this.date,
    required this.author,
  });
  final String image;
  final String news;
  final String date;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 180,
              height: 91,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    news,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    // "Chhattisgarh Polls: Ex Cong\nMLA Blames TS Deo For Losing\nPower",
                    "$author . $date",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6D6265),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              height: 91,
              child: Image.network(
                image,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, color: Colors.red);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
