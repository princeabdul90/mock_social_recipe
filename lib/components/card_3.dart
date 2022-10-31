import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../utils/recipe_theme.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;
  const Card3({Key? key, required this.recipe}) : super(key: key);

  List<Widget> createChips() {
    final chips = <Widget>[];
    recipe.tags.take(6).forEach((element) {
      final chip = Chip(
        label: Text(
          element,
          style: RecipeTheme.darkThemeText.bodyText1,
        ),
        backgroundColor: Colors.black.withOpacity(0.7),
      );
      chips.add(chip);
    });
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          constraints: const BoxConstraints.expand(
            height: 450,
            width: 350,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipe.backgroundImage),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.book,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      recipe.title,
                      style: RecipeTheme.darkThemeText.headline2,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 16,
                        children: createChips(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
