import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/icon_text_button.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What's on your mind?",
                  ),
                ),
              )
            ],
          ),
          const Divider(
            height: 10, thickness: 0.5,
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTextButton(
                    icon: Icons.videocam,
                    text: "Live",
                    onPressed: (){

                    },
                    iconColor: Colors.red
                ),
                const VerticalDivider(
                  width: 8,
                ),
                IconTextButton(
                    icon: Icons.photo_library,
                    text: "Photo",
                    onPressed: (){

                    },
                    iconColor: Colors.green
                ),
                const VerticalDivider(
                  width: 8,
                ),
                IconTextButton(
                    icon: Icons.video_call,
                    text: "Room",
                    onPressed: (){

                    },
                    iconColor: Colors.red
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
