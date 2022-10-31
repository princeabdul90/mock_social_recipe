import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

// Mock recipe service that grab sample json data to mock recipe request/response
class MockRecipeService {

  // Batch request that get both today recipe and friend's feeds
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipe();
    final friendPosts = await _getFriendFeed();

    return ExploreData(todayRecipes, friendPosts);
  }

  // Get sample explore recipe json to display in ui
  Future<List<ExploreRecipe>> _getTodayRecipe() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json data from file system
    final dataString = await _loadAsset('assets/sample_data/sample_explore_recipes.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe data and convert to ExploreRecipe object
    if(json['recipes'] != null) {
      final recipes = <ExploreRecipe>[];
      json['recipes'].forEach((v){
        recipes.add(ExploreRecipe.fromJson(v));
      });
      return recipes;
    }else{
      return [];
    }
  }

  // Get post data to display in ui
  Future<List<Post>> _getFriendFeed() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load feed from file system
    final dataString = await _loadAsset('assets/sample_data/sample_friends_feed.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each feed and convert to Post object
    if(json['feed'] != null){
      final posts = <Post>[];
      json['feed'].forEach((v){
        posts.add(Post.fromJson(v));
      });
      return posts;
    }else {
      return [];
    }
  }

  // Get sample recipe to display in ui
  Future<List<SampleRecipe>> getSampleRecipe() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load feed data from file system
    final dataString = await _loadAsset('assets/sample_data/sample_recipes.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each feed and convert to SimpleRecipe object
    if(json['recipes'] != null) {
      final recipes = <SampleRecipe>[];
      json['recipes'].forEach((v){
        recipes.add(SampleRecipe.fromJson(v));
      });
      return recipes;
    }else{
      return [];
    }
  }


  // Load sample json from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

}










