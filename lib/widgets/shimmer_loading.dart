import 'package:flutter/material.dart';

class Shimmer extends StatefulWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const Shimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final base = widget.baseColor ??
        (isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0));
    final highlight = widget.highlightColor ??
        (isDark ? const Color(0xFF334155) : const Color(0xFFF1F5F9));

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [base, highlight, base],
              stops: const [0.0, 0.5, 1.0],
              begin: const Alignment(-1.0, -0.3),
              end: const Alignment(1.0, 0.3),
              transform: _SlidingGradientTransform(
                slidePercent: _controller.value,
              ),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;

  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
      bounds.width * (slidePercent * 2 - 1),
      0,
      0,
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxShape shape;

  const ShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: shape,
        borderRadius:
            shape == BoxShape.rectangle ? BorderRadius.circular(borderRadius) : null,
      ),
    );
  }
}

class ShimmerSkeletonView extends StatelessWidget {
  const ShimmerSkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Shimmer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 60,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Nav Skeleton
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ShimmerBox(width: 140, height: 32, borderRadius: 8),
                  if (!isMobile)
                    const Row(
                      children: [
                        ShimmerBox(width: 60, height: 20),
                        SizedBox(width: 16),
                        ShimmerBox(width: 60, height: 20),
                        SizedBox(width: 16),
                        ShimmerBox(width: 60, height: 20),
                        SizedBox(width: 16),
                        ShimmerBox(width: 60, height: 20),
                      ],
                    )
                  else
                    const ShimmerBox(width: 32, height: 32, borderRadius: 8),
                ],
              ),
              const SizedBox(height: 60),

              // Hero Skeleton
              if (isMobile) ...[
                const Center(
                  child: ShimmerBox(
                    width: 180,
                    height: 180,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 32),
                const ShimmerBox(width: 120, height: 24, borderRadius: 12),
                const SizedBox(height: 16),
                const ShimmerBox(width: 240, height: 36, borderRadius: 8),
                const SizedBox(height: 12),
                const ShimmerBox(width: 200, height: 20, borderRadius: 6),
                const SizedBox(height: 20),
                const ShimmerBox(width: double.infinity, height: 60, borderRadius: 8),
              ] else ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerBox(width: 120, height: 28, borderRadius: 14),
                          SizedBox(height: 20),
                          ShimmerBox(width: 320, height: 48, borderRadius: 8),
                          SizedBox(height: 12),
                          ShimmerBox(width: 260, height: 24, borderRadius: 6),
                          SizedBox(height: 20),
                          ShimmerBox(width: 400, height: 40, borderRadius: 8),
                          SizedBox(height: 28),
                          Row(
                            children: [
                              ShimmerBox(width: 140, height: 48, borderRadius: 12),
                              SizedBox(width: 16),
                              ShimmerBox(width: 140, height: 48, borderRadius: 12),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    const Expanded(
                      flex: 2,
                      child: Center(
                        child: ShimmerBox(
                          width: 240,
                          height: 240,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 80),

              // Stats Cards Skeleton
              Row(
                children: List.generate(
                  isMobile ? 2 : 4,
                  (index) => const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ShimmerBox(height: 100, borderRadius: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),

              // Project Cards Skeleton
              const ShimmerBox(width: 200, height: 28, borderRadius: 8),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Expanded(child: ShimmerBox(height: 220, borderRadius: 16)),
                  SizedBox(width: 20),
                  Expanded(child: ShimmerBox(height: 220, borderRadius: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
