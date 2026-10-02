import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/routes/app_pages.dart';
import 'package:shop_app/features/splash/view_model/cubit.dart';
import 'package:shop_app/features/splash/view_model/state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..goNextPage(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashOnBoardPageState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppPages.loginScreen,
                (route) => false,
              );
            }
          },
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFEAF4FF), Colors.white, Color(0xFFD6E8FF)],
              ),
            ),
            child: Stack(
              children: [
                // Decorative circles
                Positioned(top: -70, left: -60, child: _buildCircle(200)),

                Positioned(bottom: -80, right: -60, child: _buildCircle(230)),

                // Main content
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            padding: const EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF1976D2)
                                      .withValues(alpha: 0.15),
                                  blurRadius: 35,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/images/app_icon.png',
                              height: 150,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Shop ',
                                      style: TextStyle(
                                        color: Color(0xFF123B75),
                                        fontSize: 38,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'App',
                                      style: TextStyle(
                                        color: Color(0xFF2589F5),
                                        fontSize: 38,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                'Your Shopping, Simplified',
                                style: TextStyle(
                                  color: Color(0xFF60758F),
                                  fontSize: 15,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 45),

                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: const SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Color(0xFF2589F5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom label
                Positioned(
                  bottom: 35,
                  left: 0,
                  right: 0,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      'WELCOME TO SHOP APP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF60758F),
                        fontSize: 11,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            const Color(0xFF2589F5).withValues(alpha: 0.16),
            const Color(0xFF2589F5).withValues(alpha: 0.02),
          ],
        ),
      ),
    );
  }
}
