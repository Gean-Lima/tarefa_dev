import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tarefa_dev/sources/entities/period.dart';
import 'package:tarefa_dev/sources/pages/configurations/components/dialog_new_period_component.dart';

// ignore: must_be_immutable
class ItemPeriodComponent extends StatelessWidget {
  Period period;

  ItemPeriodComponent({super.key, required this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogNewPeriodComponent(
                  period: period,
                );
              });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE9E9E9)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  period.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${DateFormat('d/MM/y').format(period.start)} a ${DateFormat('d/MM/y').format(period.end)}',
                style: GoogleFonts.inter(
                  color: const Color(0xFF3D3D3D),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
