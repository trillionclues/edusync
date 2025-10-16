import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_habits/presentation/auth/cubits/auth_cubit.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, authState) {
      final userName = authState.user.displayName ?? 'Guest';
      final firstName = userName.split(' ').first;

      return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 30,
                      height: 1.2,
                    ),
                    children: [
                       const TextSpan(
                        text: 'Hey, ',
                        style: TextStyle(fontWeight: FontWeight.w400,),
                      ),
                      TextSpan(
                        text: '$firstName!',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
