import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarefa_dev/sources/components/avatar_component.dart';
import 'package:tarefa_dev/sources/services/colors_app.dart';

class ContainerFooterComponent extends StatelessWidget {
  const ContainerFooterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 65.04, bottom: 67.49),
      child: Row(
        children: [
          AvatarComponent(
            image: 'assets/images/profile.png',
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'João',
                style: GoogleFonts.inter(
                  fontSize: 16.78,
                  fontWeight: FontWeight.w500,
                  color: ColorsApp.primary
                ),
              ),
              Text(
                'Sair',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorsApp.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorsApp.primary
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}