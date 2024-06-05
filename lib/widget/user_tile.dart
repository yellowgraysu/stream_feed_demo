import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_extension.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

/// UI widget to display an [User]'s profile picture and name.
///
/// Optional: [onTap] callback and [trailing] widget.
class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.user,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  final User user;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.profileImage)),
      title: Text(user.fullName),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
