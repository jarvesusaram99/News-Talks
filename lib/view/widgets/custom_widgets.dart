import 'package:flutter/material.dart';

BoxDecoration backgroundImageBoxDecoration({String? imageUrl}) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(imageUrl!),
      fit: BoxFit.cover,
    ),
  );
}
