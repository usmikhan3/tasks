// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SelectDateView extends StatelessWidget {
  const SelectDateView({
    Key? key,
    this.title,
    this.color = Colors.grey,
    this.onTap,
    this.isSelected,
    this.date,
    this.day,
  }) : super(key: key);

  final String? title;
  final String? date;
  final String? day;
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
            color: Colors.white,
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: isSelected ?? false ? Colors.blue : color,
              ),
              child: Center(
                child: Text(title!),
              ),
            ),

            //padding: const EdgeInsets.all(16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(date!),
                const SizedBox(
                  height: 3,
                ),
                Text(day!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
