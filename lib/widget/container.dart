import 'package:flutter/material.dart';

class ContainerHewan extends StatelessWidget {
  const ContainerHewan({Key? key, required this.imageAssets, required this.onTap}) : super(key: key);
  final String imageAssets;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
            margin: const EdgeInsets.all(15),
            child: Card(elevation: 10,child: Image(image: AssetImage(imageAssets),fit: BoxFit.cover)),
          ),
    );
  }
}