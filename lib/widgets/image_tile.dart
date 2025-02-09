// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;
  final double extent;

  const ImageTile({
    super.key,
    required this.imageSource,
    required this.index,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      shadowColor:
          Colors.black.withOpacity(0.3), // Adjust shadow color and opacity
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        height: extent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // CachedNetworkImage(imageUrl: imageSource),
            Image.network(
              imageSource,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4), // Add padding for better spacing
                color: Colors.black.withOpacity(
                    0.6), // Semi-transparent background for readability
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Art ${(index + 1)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //change icon on filed heart
                        //manage state
                      },
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
