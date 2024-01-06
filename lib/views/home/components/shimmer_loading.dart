import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final int itemCount;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerLoading({
    super.key,
    this.itemCount = 6,
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      enabled: true,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (_, __) => const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: PlaceholderLines(count: 3),
        ),
      ),
    );
  }
}

class PlaceholderLines extends StatelessWidget {
  final int count;

  const PlaceholderLines({super.key, this.count = 3});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List.generate(
      count,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Container(
          width: double.infinity,
          height: 8.0,
          color: Colors.black,
        ),
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 48.0,
          height: 48.0,
          color: Colors.black,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgets,
          ),
        ),
      ],
    );
  }
}
