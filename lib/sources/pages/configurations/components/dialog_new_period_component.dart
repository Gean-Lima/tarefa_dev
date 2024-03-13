import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tarefa_dev/sources/blocs/dialog_period/dialog_period_bloc.dart';
import 'package:tarefa_dev/sources/blocs/dialog_period/dialog_period_event.dart';
import 'package:tarefa_dev/sources/blocs/dialog_period/dialog_period_state.dart';
import 'package:tarefa_dev/sources/blocs/periods/periods_bloc.dart';
import 'package:tarefa_dev/sources/blocs/periods/periods_events.dart';
import 'package:tarefa_dev/sources/components/custom_button_component.dart';
import 'package:tarefa_dev/sources/components/custom_text_field_component.dart';
import 'package:tarefa_dev/sources/components/custom_text_field_datetime_component.dart';
import 'package:tarefa_dev/sources/components/divider_component.dart';
import 'package:tarefa_dev/sources/entities/period.dart';
import 'package:tarefa_dev/sources/pages/configurations/components/custom_text_field_select_component.dart';
import 'package:tarefa_dev/sources/services/colors_app.dart';
import 'package:tarefa_dev/sources/services/validations_app_mixin.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class DialogNewPeriodComponent extends StatefulWidget {
  Period? period;

  DialogNewPeriodComponent({super.key, this.period});

  @override
  State<StatefulWidget> createState() => DialogNewPeriodComponentState();
}

class DialogNewPeriodComponentState extends State<DialogNewPeriodComponent>
    with ValidationsAppMixin {
  DialogPeriodBloc bloc = DialogPeriodBloc();

  TextEditingController nameController = TextEditingController();
  TextEditingController meta1Controller = TextEditingController();
  TextEditingController meta2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool get isNotEditing => widget.period != null && !bloc.state.edition;

  @override
  void initState() {
    if (widget.period != null) {
      bloc.add(DialogPeriodUpdate(
        name: widget.period!.name,
        start: widget.period!.start,
        end: widget.period!.end,
        category: widget.period!.category,
        meta1: widget.period!.meta1,
        meta2: widget.period!.meta2
      ));

      nameController.text = widget.period!.name;
      meta1Controller.text = widget.period!.meta1.toString();
      meta2Controller.text = widget.period!.meta2.toString();
    }

    nameController.addListener(() {
      bloc.add(DialogPeriodUpdate(
        name: nameController.text
      ));
    });

    meta1Controller.addListener(() {
      bloc.add(DialogPeriodUpdate(
        meta1: int.parse(meta1Controller.text)
      ));
    });

    meta2Controller.addListener(() {
      bloc.add(DialogPeriodUpdate(
        meta2: int.parse(meta2Controller.text)
      ));
    });

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    meta1Controller.dispose();
    meta2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, DialogPeriodState state) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(28)),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.center,
                          child: Text(
                            'Novo período',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset(
                              'assets/svg/close.svg',
                              height: 28,
                              width: 28,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextFieldComponent(
                      controller: nameController,
                      borderWidth: 0,
                      backgroundColor: const Color(0xFFF5F6FA),
                      hintText: 'Nomeie seu periodo',
                      validator: isNotEmpty,
                      readOnly: isNotEditing,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 26,
                      ),
                      decoration: BoxDecoration(
                        color: isNotEditing
                            ? Colors.transparent
                            : const Color(0xFFF5F6FA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Começa',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              isNotEditing
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        DateFormat("d 'de' MMM. 'de' yyyy")
                                            .format(widget.period!.start),
                                        style: GoogleFonts.inter(fontSize: 16),
                                      ),
                                    )
                                  : CustomTextFieldDateTimeComponent(
                                      height: 35,
                                      width: 146,
                                      borderRadius: 10,
                                      borderWidth: 1,
                                      backgroundColor: Colors.white,
                                      selectedDate: state.start,
                                      onChange: (DateTime date) {
                                        bloc.add(DialogPeriodUpdate(
                                          start: date
                                        ));
                                      },
                                    )
                            ],
                          ),
                          DividerComponent(
                            height: 1,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Termina',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              isNotEditing
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        DateFormat("d 'de' MMM. 'de' yyyy")
                                            .format(widget.period!.end),
                                        style: GoogleFonts.inter(fontSize: 16),
                                      ),
                                    )
                                  : CustomTextFieldDateTimeComponent(
                                      height: 35,
                                      width: 146,
                                      borderRadius: 10,
                                      borderWidth: 1,
                                      backgroundColor: Colors.white,
                                      selectedDate: state.end,
                                      onChange: (DateTime date) {
                                        bloc.add(DialogPeriodUpdate(
                                          end: date
                                        ));
                                      })
                            ],
                          ),
                          DividerComponent(
                            height: 1,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Categoria',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              isNotEditing
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        'Categoria ${widget.period!.category.num}',
                                        style: GoogleFonts.inter(fontSize: 16),
                                      ),
                                    )
                                  : CustomTextFieldSelectComponent(
                                      height: 35,
                                      width: 146,
                                      borderRadius: 10,
                                      borderWidth: 1,
                                      backgroundColor: Colors.white,
                                      category: state.category,
                                      onChange: (val) {
                                        bloc.add(DialogPeriodUpdate(
                                          category: val
                                        ));
                                      },
                                    )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 26,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Meta 1',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              isNotEditing
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        widget.period!.meta1.toString(),
                                        style: GoogleFonts.inter(fontSize: 16),
                                      ),
                                    )
                                  : CustomTextFieldComponent(
                                      controller: meta1Controller,
                                      height: 35,
                                      width: 85,
                                      borderRadius: 10,
                                      borderWidth: 1,
                                      backgroundColor: Colors.white,
                                      hintText: 'Un',
                                      textAlign: TextAlign.center,
                                      validator: (value) => combine([
                                        () => isNotEmpty(value),
                                        () => isNotNumber(value)
                                      ]),
                                      errorText: false,
                                    )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Meta 2',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              isNotEditing
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        widget.period!.meta2.toString(),
                                        style: GoogleFonts.inter(fontSize: 16),
                                      ),
                                    )
                                  : CustomTextFieldComponent(
                                      controller: meta2Controller,
                                      height: 35,
                                      width: 85,
                                      borderRadius: 10,
                                      borderWidth: 1,
                                      backgroundColor: Colors.white,
                                      hintText: 'Un',
                                      textAlign: TextAlign.center,
                                      validator: (value) => combine([
                                        () => isNotEmpty(value),
                                        () => isNotNumber(value)
                                      ]),
                                      errorText: false,
                                    )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: isNotEditing
                            ? [
                                CustomButtonComponent(
                                  backgroundColor: ColorsApp.danger,
                                  onPressed: () {
                                    BlocProvider.of<PeriodsBloc>(
                                      context,
                                      listen: false,
                                    ).add(
                                      PeriodsEventDelete(
                                        periodId: widget.period!.id
                                      ),
                                    );

                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Excluir'),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                CustomButtonComponent(
                                  onPressed: () {
                                    bloc.add(DialogPeriodUpdate(
                                      edition: true
                                    ));
                                  },
                                  child: const Text('Editar'),
                                )
                              ]
                            : [
                                CustomButtonComponent(
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) return;

                                    if (widget.period != null) {
                                      BlocProvider.of<PeriodsBloc>(
                                        context,
                                        listen: false,
                                      ).add(
                                        PeriodsEventUpdate(
                                          period: Period(
                                            id: widget.period!.id,
                                            name: state.name,
                                            start: state.start,
                                            end: state.end,
                                            category: state.category,
                                            meta1: state.meta1,
                                            meta2: state.meta2,
                                          ),
                                        ),
                                      );

                                      Navigator.of(context).pop();
                                      return;
                                    }

                                    BlocProvider.of<PeriodsBloc>(
                                      context,
                                      listen: false,
                                    ).add(
                                      PeriodsEventAdd(
                                        period: Period(
                                          id: const Uuid().v4(),
                                          name: state.name,
                                          start: state.start,
                                          end: state.end,
                                          category: state.category,
                                          meta1: state.meta1,
                                          meta2: state.meta2,
                                        ),
                                      ),
                                    );

                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Concluir'),
                                )
                              ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
