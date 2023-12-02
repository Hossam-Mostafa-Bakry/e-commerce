import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.all(18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          borderSide: BorderSide(
            color: Color(0xff004182),
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        hintText: "what do you search for?",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          borderSide: BorderSide(
            color: Color(0xff004182),
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff004182),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          )
        ),
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: Color(0xff004182),
          size: 28,
        )
      )
    );
  }
}
