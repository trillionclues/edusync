import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const route = '/splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0, 0.5, curve: Curves.easeIn)),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0, 0.6, curve: Curves.elasticOut)),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.3, 0.9, curve: Curves.easeOutCubic)),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        final isAuthenticated = context.read<AuthCubit>().state.isAuthenticated;
        if (isAuthenticated) {
          context.go('/home');
        } else {
          context.go('/login');
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: -10,
                right: -10,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: _buildMascot(),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 24,
                right: 24,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeadline("GO FOR", Colors.white),
                        _buildHeadline(
                            'BETTER\nHABITS', const Color(0xFF4E55E0)),
                        _buildHeadline('WITH\nMOE', Colors.white),
                        const SizedBox(height: 16),
                        CustomPaint(
                            size: const Size(100, 20), painter: WavePainter()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 48,
        fontWeight: FontWeight.bold,
        height: 1.1,
        letterSpacing: -1,
      ),
    );
  }

  Widget _buildMascot() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(320, 320),
          painter: BlobPainter(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _buildEye(),
              const SizedBox(width: 50),
              _buildEye(),
            ]),
            const SizedBox(height: 25),
            CustomPaint(size: const Size(100, 50), painter: SmilePainter()),
          ],
        ),
        Positioned(
          bottom: 40,
          left: -40,
          child: ClipPath(
            clipper: SpeechBubbleClipper(),
            child: Container(
              width: 180,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: Colors.white,
              child: const Text(
                "IT'S MORE FUN\nTOGETHER!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2D2D2D),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  height: 1.3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEye() {
    return CustomPaint(size: const Size(30, 15), painter: EyePainter());
  }
}

class BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF4E55E0);

    final path = Path()
      ..moveTo(size.width * 0.5, 0)
      ..cubicTo(
        size.width * 0.9,
        size.height * 0.05,
        size.width * 1.1,
        size.height * 0.5,
        size.width * 0.6,
        size.height * 0.95,
      )
      ..cubicTo(
        size.width * 0.2,
        size.height * 1.05,
        -size.width * 0.1,
        size.height * 0.5,
        size.width * 0.4,
        size.height * 0.05,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SpeechBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(10, 0)
      ..lineTo(size.width - 10, 0)
      ..quadraticBezierTo(size.width, 0, size.width, 10)
      ..lineTo(size.width, size.height - 20)
      ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
      ..lineTo(size.width * 0.4, size.height)
      ..lineTo(size.width * 0.35, size.height + 12) // tail
      ..lineTo(size.width * 0.3, size.height)
      ..lineTo(10, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 10)
      ..lineTo(0, 10)
      ..quadraticBezierTo(0, 0, 10, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2D2D2D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width / 2, size.height, size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class EyePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2D2D2D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6FD89C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    const waveHeight = 5.0;
    const waveLength = 15.0;

    final path = Path()..moveTo(0, size.height / 2);

    for (double x = 0; x < size.width; x += waveLength) {
      path
        ..quadraticBezierTo(
          x + waveLength / 4,
          size.height / 2 - waveHeight,
          x + waveLength / 2,
          size.height / 2,
        )
        ..quadraticBezierTo(
          x + 3 * waveLength / 4,
          size.height / 2 + waveHeight,
          x + waveLength,
          size.height / 2,
        );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
