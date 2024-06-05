import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/select_user_page.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

const apiKey = ''; //TODO: Add your Stream API key
const appId = ''; //TODO: Add your Stream application ID

/// Task list
/// 1. Hashtags
/// - get all hashtags
/// - search posts by hashtags

/// 2. All Posts (hashtags, images, timestamp, name, profile image, commonts count, like count and comments)
/// - get all own posts
/// - get all others posts

/// 3. My Post
/// -  create a new post with hashtags and images
/// - like/unlike own post
/// - comment on own post
/// - edit own post
/// - delete own post
/// - delete own comment
/// - Report other's comment

/// 4. Other's Posts
/// - like/unlike other's post
/// - comment on other's post
/// - report other's post
/// - delete own comment
/// - Report other's comment

/// 5. Notifications
/// - get all notifications

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => FeedProvider(
        bloc: FeedBloc(
          client: StreamFeedClient(apiKey, appId: appId, secret: null),
        ),
        child: child!,
      ),
      home: const SelectUserPage(),
    );
  }
}
