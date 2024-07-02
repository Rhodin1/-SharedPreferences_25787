import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedpreferences/Provider/Provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark theme'),
              trailing: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme()),
            )
          ],
        );
      }),
    );
  }
}
