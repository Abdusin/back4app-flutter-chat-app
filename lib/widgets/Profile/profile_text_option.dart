import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTextOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final double? margin;
  final VoidCallback? onTap;
  const ProfileTextOption({Key? key, this.onTap, required this.label, required this.icon, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: const Color(0xFF262A34), borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: margin ?? 10.0), // 8.0 as default margin.
              child: ListTile(
                title: Row(
                  children: [
                    Icon(icon, color: Colors.white, size: 24),
                    Text(label, style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
                  ],
                ),
                trailing: const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
