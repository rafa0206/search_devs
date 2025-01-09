import 'package:flutter/material.dart';
import 'package:search_devs/utils/constants/theme.dart';

class ContactButton extends StatelessWidget {
  final VoidCallback onTap;

  const ContactButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(AppTheme.mainPurple),
        ),
        onPressed: onTap,
        child: const Text(
          'Contato',
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 18, color: AppTheme.mainWhite),
        ),
      ),
    );
  }
}
