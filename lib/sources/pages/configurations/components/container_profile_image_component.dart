import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarefa_dev/sources/components/avatar_component.dart';

class ContainerProfileImageComponent extends StatelessWidget {
  const ContainerProfileImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 129.62,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AvatarComponent(
              image: 'assets/images/profile.png',
            ),
            Text(
              'Editar Foto',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 11
              ),
            )
          ],
        ),
      )
    );
  }

}