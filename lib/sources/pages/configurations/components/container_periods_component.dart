import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerPeriodsComponent extends StatefulWidget {
  List<Widget> children;
  bool isLoading;

  ContainerPeriodsComponent({
    super.key,
    required this.children,
    this.isLoading = false,
  });

  @override
  State<StatefulWidget> createState() => ContainerPeriodsComponentState();
}

class ContainerPeriodsComponentState extends State<ContainerPeriodsComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 345,
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 23),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: widget.isLoading
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: widget.isLoading
                ? [
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    )
                  ]
                : widget.children,
          ),
        ),
      ),
    );
  }
}
