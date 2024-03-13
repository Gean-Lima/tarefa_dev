import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarefa_dev/sources/components/custom_text_field_component.dart';

// ignore: must_be_immutable
class CustomTextFieldDateTimeComponent extends StatefulWidget {
  Widget? label;
  double? height;
  double? width;
  double borderWidth;
  double borderRadius;
  Color? backgroundColor;
  String? hintText;
  TextAlign textAlign;
  DateTime selectedDate;
  void Function(DateTime) onChange;

  CustomTextFieldDateTimeComponent({
    super.key,
    this.label,
    this.height,
    this.width,
    this.borderWidth = 2,
    this.borderRadius = 6,
    this.backgroundColor,
    this.hintText,
    this.textAlign = TextAlign.start,
    required this.selectedDate,
    required this.onChange
  });

  @override
  State<StatefulWidget> createState() => CustomTextFieldDateTimeComponentState();
}

class CustomTextFieldDateTimeComponentState extends State<CustomTextFieldDateTimeComponent> {
  TextEditingController controller = TextEditingController();
  
  @override
  void initState() {
    super.initState();

    controller.text = DateFormat("d 'de' MMM. 'de' yyyy").format(widget.selectedDate);
  }

  openDatePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10)
    );

    if (date != null) {
      controller.text = DateFormat("d 'de' MMM. 'de' yyyy").format(date);
      widget.onChange(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldComponent(
      label: widget.label,
      controller: controller,
      height: widget.height,
      width: widget.width,
      borderWidth: widget.borderWidth,
      borderRadius: widget.borderRadius,
      backgroundColor: widget.backgroundColor,
      hintText: widget.hintText,
      textAlign: widget.textAlign,
      readOnly: true,
      onTap: openDatePicker,
    );
  }

}