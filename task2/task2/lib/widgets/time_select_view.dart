// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SelectTimeView extends StatelessWidget {
  const SelectTimeView({
    Key? key,
    this.time,
    this.ContainerColor = Colors.white,
    this.color,
    this.onTap,
    this.isSelected,
  }) : super(key: key);

  final String? time;

  final Color? ContainerColor;
  final Color? color;
  final VoidCallback? onTap;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ?? false ? color : ContainerColor,
            border: Border.all(
              width: isSelected ?? false ? 3 : 1,
              color: Colors.black,
            ),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(3, 5),
                  spreadRadius: 2)
            ]),
        child: Center(
          child: Text(
            time!,
          ),
        ),
      ),
    );
  }
}
