import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SocialLoginType { google, apple }

class SocialLoginButton extends StatelessWidget {
  final SocialLoginType type;
  final VoidCallback onPressed;
  final bool isLoading;

  const SocialLoginButton({
    super.key,
    required this.type,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: _getTextColor(),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: _getTextColor(),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  _getIconPath(),
                  width: 20,
                  height: 20,
                  colorFilter: _getColorFilter(),
                ),
                const SizedBox(width: 12),
                Text(
                  _getButtonText(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
    );
  }

  String _getIconPath() {
    switch (type) {
      case SocialLoginType.google:
        return 'assets/icons/google.svg';
      case SocialLoginType.apple:
        return 'assets/icons/apple.svg';
    }
  }

  String _getButtonText() {
    switch (type) {
      case SocialLoginType.google:
        return 'Continue with Google';
      case SocialLoginType.apple:
        return 'Continue with Apple';
    }
  }

  Color _getTextColor() {
    switch (type) {
      case SocialLoginType.google:
        return Colors.black;
      case SocialLoginType.apple:
        return Colors.black;
    }
  }

  ColorFilter? _getColorFilter() {
    switch (type) {
      case SocialLoginType.google:
      case SocialLoginType.apple:
        return null;
    }
  }
}
