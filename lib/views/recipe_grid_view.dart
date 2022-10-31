import 'package:flutter/material.dart';
import '../models/models.dart';
import '../components/components.dart';

class RecipeGridView extends StatelessWidget {
  final List<SampleRecipe> recipes;
  const RecipeGridView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 16,
      ),
      child: GridView.builder(
          itemCount: recipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipeThumbnail(recipe: recipe);
          }),
    );
  }
}
