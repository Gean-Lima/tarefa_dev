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
            leadingWidth: 45,
            title: Text(
              'Configurações',
              style:
                  GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w600),
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
                        height: 35,
                        label: Text(
                          'Apelido',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const ContainerProfileImageComponent()
                  ],
                ),
                DividerComponent(
                  margin: const EdgeInsets.only(top: 26, bottom: 16),
                ),
                Text(
                  'Períodos',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(height: 18),
                ContainerPeriodsComponent(
                  isLoading: state.loading,
                  children: state.periods
                    .map((period) => ItemPeriodComponent(period: period))
                    .toList(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.topRight,
                  child: CustomButtonComponent(
                    onPressed: addPeriod,
                    height: 30,
                    child: const Text('Adicionar Periodo'),
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
