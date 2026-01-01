import 'package:flutter/material.dart';



class NewsTileItem extends StatelessWidget {
  const NewsTileItem({super.key, required this.image, required this.news, required this.date, required this.title });
  final String image;
  final String news;
  final String date;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 18,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 91,
              width: 160,
              child: Image.network(image),
            ),
            Container(
              width: 180,
              height: 91,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    // "Chhattisgarh Polls: Ex Cong\nMLA Blames TS Deo For Losing\nPower",
                    news,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    child: Text(
                      textAlign: TextAlign.end,
                      date,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffD2B0B0),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
