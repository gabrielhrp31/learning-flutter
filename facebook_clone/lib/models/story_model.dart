import 'package:meta/meta.dart';
import 'package:facebook_clone/models/models.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;

  Story(this.user,this.imageUrl, { this.isViewed = false });
}
