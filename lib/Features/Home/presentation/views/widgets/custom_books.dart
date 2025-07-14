import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 0.25 / 0.34,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
