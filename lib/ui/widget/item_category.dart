import 'package:app_notes/ui/widget/text_frave.dart';
import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const ItemCategory(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      border: Border.all(color: color, width: 4.0),
                      borderRadius: BorderRadius.circular(7.0)),
                ),
                const SizedBox(width: 10.0),
                TextFrave(text: text, fontSize: 19),
              ],
            ),
            Row(
              children: [
                Text('${text == text ? const Icon(Icons.check) : Container()}')
              ],
            )
          ],
        ),
      ),
    );
  }
}
