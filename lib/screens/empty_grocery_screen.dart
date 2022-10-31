import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: AspectRatio(
                  aspectRatio: 1/1,
                  child: Image.asset('assets/fooderlich_assets/empty_list.png'),
                )
            ),
            Text('No Groceries', style: GoogleFonts.lato(fontSize: 21),),
            const SizedBox(height: 8,),
            const Text('Empty Ingredients? \n'
              'Tap the + button to write them down!', textAlign: TextAlign.center,),
            MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Browse Recipe'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
                ),
                onPressed: (){
                  Provider.of<AppStateManager>(context, listen: false).goToRecipe();
                }
            )
          ],
        ),
      ),
    );
  }
}
