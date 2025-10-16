import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/core/theme/app_colors.dart';
import 'package:micro_habits/core/ui/widgets/mh_button.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColors.primary,
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    const Text(
                      'Build healthy habits with us',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: -2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Image.asset('assets/images/mascot.png'),
                    const Spacer(flex: 2),
                    if (state.isLoading)
                      const SizedBox(
                        height: 56,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      )
                    else ...[
                      MHButton(
                        text: 'Continue with Google',
                        textColor: AppColors.white,
                        backgroundColor: AppColors.white.withOpacity(0.25),
                        loading: state.isLoading,
                        onPressed: () =>
                            context.read<AuthCubit>().signInWithGoogle(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ],
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'By starting or signing in, you agree\nto our ',
                            ),
                            TextSpan(
                              text: 'Terms of use',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
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
          },
        ),
      ),
    );
  }
}
