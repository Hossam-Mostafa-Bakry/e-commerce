import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const CategoryItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(3),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              color: Color(0xff004182),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Color(0xff06004F),
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
