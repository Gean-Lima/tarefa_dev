import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarefa_dev/sources/blocs/periods/periods_bloc.dart';
import 'package:tarefa_dev/sources/blocs/periods/periods_events.dart';
import 'package:tarefa_dev/sources/blocs/periods/periods_state.dart';
import 'package:tarefa_dev/sources/components/custom_button_component.dart';
import 'package:tarefa_dev/sources/components/custom_text_field_component.dart';
import 'package:tarefa_dev/sources/components/divider_component.dart';
import 'package:tarefa_dev/sources/pages/configurations/components/container_footer_component.dart';
import 'package:tarefa_dev/sources/pages/configurations/components/container_periods_component.dart';
import 'package:tarefa_dev/sources/pages/configurations/components/container_profile_image_component.dart';
import 'package:tarefa_dev/sources/pages/configurations/components/item_period_component.dart';
import 'package:tarefa_dev/sources/pages/configurations/components/dialog_new_period_component.dart';

class ConfigurationsPage extends StatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  State<StatefulWidget> createState() => ConfigurationsPageState();
}

class ConfigurationsPageState extends State<ConfigurationsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PeriodsBloc>(context).add(PeriodsEventPeriods());
  }

  addPeriod() {
    showDialog(
        context: context,
        builder: (context) => DialogNewPeriodComponent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeriodsBloc, PeriodsState>(
      builder: ((context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 21),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svg/back.svg',
                ),
              ),
            ),
            leadingWidth: 42,
            title: Text(
              'Configurações',
              style:
                  GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            titleSpacing: 5,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: CustomTextFieldComponent(
                        height: 31,
                        // width: 198.06,
                        label: Text(
                          'Apelido',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                    const SizedBox(width: 9.9),
                    const ContainerProfileImageComponent()
                  ],
                ),
                DividerComponent(
                  height: 1.9,
                  margin: const EdgeInsets.only(top: 22.31, bottom: 16.67),
                ),
                Text(
                  'Períodos',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 17.82),
                ContainerPeriodsComponent(
                  isLoading: state.loading,
                  children: state.periods
                    .map((period) => ItemPeriodComponent(period: period))
                    .toList(),
                ),
                const SizedBox(height: 12),
                Container(
                  alignment: Alignment.topRight,
                  child: CustomButtonComponent(
                    onPressed: addPeriod,
                    width: 120,
                    height: 24,
                    child: Text(
                      'Adicionar Periodo',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 10
                      ),
                    ),
                  ),
                ),
                const ContainerFooterComponent()
              ],
            ),
          ),
        );
      }),
    );
  }
}
