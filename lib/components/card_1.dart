import 'package:flutter/material.dart';
import '../models/models.dart';
import '../utils/recipe_theme.dart';

class Card1 extends StatelessWidget {
  final ExploreRecipe recipe;
  const Card1({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints.expand(
          height: 450,
          width: 350,
        ),
        decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipe.backgroundImage),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Stack(
          children: [
            Text(
              recipe.subtitle,
              style: RecipeTheme.darkThemeText.bodyText1,
            ),
            Positioned(
              top: 20,
              child: Text(
                recipe.title,
                style: RecipeTheme.darkThemeText.headline2,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                recipe.message,
                style: RecipeTheme.darkThemeText.bodyText1,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                recipe.role,
                style: RecipeTheme.darkThemeText.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
