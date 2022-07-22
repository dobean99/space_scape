import 'package:flutter/material.dart';
import 'package:space_scape/utils/texts/text_title.dart';

enum Language { vi, en }

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _background = false;
  bool _player = false;
  Language? _language = Language.vi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextTitle(title: "Settings"),
          SwitchListTile(
              title: Text(
                'Background Music',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(),
              ),
              value: _background,
              activeColor: Colors.blue,
              inactiveTrackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  _background = value;
                });
              }),
          SwitchListTile(
              title: Text(
                'Background Music',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(),
              ),
              value: _player,
              activeColor: Colors.blue,
              inactiveTrackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  _player = value;
                });
              }),
          ListTile(
            onTap: () => _showDialog(),
            title: Text(
              'Change language',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  _showDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: const Text('Change Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  'Vi',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black),
                ),
                trailing: const CircleAvatar(
                  radius: 18.0,
                  backgroundImage: AssetImage(
                    'assets/images/vn_flag.png',
                  ),
                ),
                leading: Radio(
                  value: Language.vi,
                  groupValue: _language,
                  onChanged: (Language? value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'En',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.black),
                ),
                trailing: const CircleAvatar(
                  radius: 18.0,
                  backgroundImage: AssetImage(
                    'assets/images/en_flag.png',
                  ),
                ),
                leading: Radio(
                  value: Language.en,
                  groupValue: _language,
                  onChanged: (Language? value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      }),
    );
  }
}
