import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class RealTime extends StatelessWidget {
  final Color color;
  final double height;

  const RealTime({
    required this.color,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(bottom: 5),
    child: RotationTransition(
      turns: const AlwaysStoppedAnimation(-(45 / 360)),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 3000),
        baseColor: color,
        highlightColor: color.withOpacity(0.3),
        direction: ShimmerDirection.ltr,
        child: SvgPicture.asset('assets/img/sign_top.svg',
            color: color, height: height),
      ),
    ),
  );
}
