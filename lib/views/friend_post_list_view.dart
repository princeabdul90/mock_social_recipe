import 'package:flutter/material.dart';
import '../models/models.dart';
import '../components/components.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPost;
  const FriendPostListView({Key? key, required this.friendPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Chef 👨‍🍳', style: Theme.of(context).textTheme.headline2,),
          const SizedBox(height: 16,),
          ListView.separated(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                final post = friendPost[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (context, index){
                return const SizedBox(height: 16,);
              },
              itemCount: friendPost.length,
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
