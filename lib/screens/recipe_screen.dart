import 'package:flutter/material.dart';
import '../views/recipe_grid_view.dart';
import '../models/models.dart';
import '../api/mock_recipe_service.dart';

class RecipeScreen extends StatelessWidget {
  final mockService = MockRecipeService();

  RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getSampleRecipe(),
        builder: (context, AsyncSnapshot<List<SampleRecipe>> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            final recipes = snapshot.data ?? [];
            return RecipeGridView(recipes: recipes);
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
    );
  }
}
