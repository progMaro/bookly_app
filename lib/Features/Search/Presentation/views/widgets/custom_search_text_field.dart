import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputMethod(),
          focusedBorder: buildOutlineInputMethod(),
          hintText: 'search',
          suffixIcon: Opacity(
            opacity: .8,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputMethod() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
