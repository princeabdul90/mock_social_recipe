import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GroceryTile({
    Key? key,
    required this.item,
    this.onComplete,
  })  : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                color: item.color,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    softWrap: true,
                    style: GoogleFonts.lato(
                        fontSize: 21.0,
                        decoration: textDecoration,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  buildImportance(),
                  const SizedBox(width: 4),
                  buildDate()
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: TextStyle(decoration: textDecoration, fontSize: 21),
              ),
              buildCheckbox(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.lato(decoration: textDecoration),
      );
    } else if (item.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.lato(
            decoration: textDecoration, fontWeight: FontWeight.w800),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
            decoration: textDecoration,
            fontWeight: FontWeight.w900,
            color: Colors.red),
      );
    } else {
      throw Exception('This Importance type does not exist.');
    }
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget buildCheckbox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }
}
