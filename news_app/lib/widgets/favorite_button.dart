import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFave = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFave ? Icons.favorite : Icons.favorite_border),
      onPressed: () {
        setState(() {
          isFave = !isFave;
        });
      },
    );
  }
}