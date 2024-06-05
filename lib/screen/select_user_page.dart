import 'package:flutter/material.dart';
import 'package:flutter_application_1/demo_user.dart';
import 'package:flutter_application_1/screen/home_page.dart';
import 'package:flutter_application_1/widget/user_tile.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

/// Page to select from connect as one of the [DemoUser]s.
class SelectUserPage extends StatelessWidget {
  const SelectUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select user')),
      body: ListView(
        children: demoUsers
            .map(
              (demoUser) => UserTile(
                user: demoUser.user,
                onTap: () async {
                  try {
                    await context.feedClient
                        .setUser(demoUser.user, demoUser.token);
                    if (context.mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                      );
                    }
                  } on Exception catch (e, st) {
                    debugPrintStack(stackTrace: st);
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
