import 'package:flutter/material.dart';
import 'package:tarefa_dev/sources/components/custom_text_field_component.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefa_dev/sources/entities/period.dart';

// ignore: must_be_immutable
class CustomTextFieldSelectComponent extends StatefulWidget {
  Widget? label;
  double? height;
  double? width;
  double borderWidth;
  double borderRadius;
  Color? backgroundColor;
  String? hintText;
  TextAlign textAlign;
  PeriodCategory category;
  void Function(PeriodCategory) onChange;

  CustomTextFieldSelectComponent({
    super.key,
    this.label,
    this.height,
    this.width,
    this.borderWidth = 2,
    this.borderRadius = 6,
    this.backgroundColor,
    this.hintText,
    this.textAlign = TextAlign.start,
    required this.category,
    required this.onChange
  });

  @override
  State<StatefulWidget> createState() => CustomTextFieldSelectComponentState();
}

class CustomTextFieldSelectComponentState extends State<CustomTextFieldSelectComponent> {
  TextEditingController controller = TextEditingController();
  
  @override
  void initState() {
    super.initState();

    controller.text = 'Categoria ${widget.category.num}';
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        fixedSize: MaterialStatePropertyAll(Size(widget.width ?? 140, 200))
      ),
      menuChildren: PeriodCategory.values.map((e) => SizedBox(
        width: widget.width,
        child: MenuItemButton(
          onPressed: () {
            widget.onChange(e);
            controller.text = 'Categoria ${e.num}';
          },
          child: Text('Categoria ${e.num}'),
        ),
      )).toList(),
      builder: (context, menuController, child) {
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
          suffixIcon: SvgPicture.asset('assets/svg/down.svg'),
          onTap: () {
            if (menuController.isOpen) {
              menuController.close();
              return;
            }

            menuController.open();
          },
        );
      },
    );
  }

}