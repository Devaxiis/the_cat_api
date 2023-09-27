import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learn_pagination/domain/models/image/image.dart';
import 'package:learn_pagination/presentation/screens/loading.dart';

class OnePage extends StatefulWidget {
  ScrollController controller;
  List<CatImage> images =[];
  bool isLoading ;
  OnePage({super.key,required this.controller,required this.images,this.isLoading = false});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage>
    with SingleTickerProviderStateMixin {
 

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MasonryGridView.builder(
            controller: widget.controller,
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              ),
             itemCount: widget.images.length,
             itemBuilder: (context, index) {
              final image = widget.images[index];
                final ratio = image.width / image.height;
              return Padding(
                padding: const EdgeInsets.all(2.5),
                child: AspectRatio(
                  aspectRatio: ratio,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: CachedNetworkImage(
                            imageUrl: image.url,
                            placeholder: (context, url) => ColoredBox(
                              color: Colors.primaries[index % Colors.primaries.length],
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                  ),

                ),
              );

             },

            ),

          if (widget.isLoading) const Loading()
        ],
      ),
    );
  }
}