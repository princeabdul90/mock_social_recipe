import 'package:flutter/material.dart';
import '../utils/recipe_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      this.imageProvider})
      : super(key: key);

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  void onTappedFavorited(){
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(imageRadius: 28, imageProvider: widget.imageProvider,),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.authorName, style: RecipeTheme.lightThemeText.headline2,),
                  Text(widget.title, style: RecipeTheme.lightThemeText.headline3,),
                ],
              )
            ],
          ),

          IconButton(
            onPressed: onTappedFavorited,
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
              size: 30,
              color: Colors.red[400],
            ),
          ),
        ],
      ),
    );
  }
}
