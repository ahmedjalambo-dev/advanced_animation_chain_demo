import 'package:flutter/material.dart';

class SequentialDotLoader extends StatefulWidget {
  const SequentialDotLoader({super.key});

  @override
  State<SequentialDotLoader> createState() => _SequentialDotLoaderState();
}

// Use SingleTickerProviderStateMixin to provide the ticker for the controller
class _SequentialDotLoaderState extends State<SequentialDotLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Declare separate Animation objects for each dot's scale and opacity
  late Animation<double> _scale1, _scale2, _scale3;
  late Animation<double> _opacity1, _opacity2, _opacity3;

  @override
  void initState() {
    super.initState();

    // 1. Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // 2. Define the Tween animations using Intervals to create the sequence

    // Dot 1: Animates in the first part of the controller's timeline (0% to 50%)
    _scale1 = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    _opacity1 = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Dot 2: Animates in the middle part (20% to 70%)
    _scale2 = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeInOut),
      ),
    );
    _opacity2 = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeIn),
      ),
    );

    // Dot 3: Animates in the last part (40% to 90%)
    _scale3 = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeInOut),
      ),
    );
    _opacity3 = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeIn),
      ),
    );

    // 3. Start the animation and loop it
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    // 4. Dispose the controller to prevent memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sequential Dot Loader'),
        backgroundColor: ThemeData().colorScheme.inversePrimary,
      ),
      body: Center(
        // Use AnimatedBuilder for efficient UI updates
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                _buildDot(scale: _scale1, opacity: _opacity1),
                _buildDot(scale: _scale2, opacity: _opacity2),
                _buildDot(scale: _scale3, opacity: _opacity3),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Helper widget to build each dot, applying the animations.
  Widget _buildDot({
    required Animation<double> scale,
    required Animation<double> opacity,
  }) {
    return Opacity(
      opacity: opacity.value,
      child: Transform.scale(
        scale: scale.value,
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
