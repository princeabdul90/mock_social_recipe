import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;
  const TodayRecipeListView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recipe for Today 🍳', style: Theme.of(context).textTheme.headline2,),
          const SizedBox(height: 16,),
          SizedBox(
            height: 400,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index){
                  return const SizedBox(width: 16,);
                },
                itemCount: recipes.length,
            ),
          )
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe){
    if(recipe.cardType == CardType.card1){
      return Card1(recipe: recipe);
    }else if(recipe.cardType == CardType.card2){
      return Card2(recipe: recipe);
    }else if(recipe.cardType == CardType.card3){
      return Card3(recipe: recipe);
    }else{
      return throw Exception("The card doesn't exist yet.");
    }
  }
}
