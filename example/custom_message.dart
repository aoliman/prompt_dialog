import 'package:flutter/material.dart';

import 'package:prompt_dialog/prompt_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Prompt Dialog'),
          onPressed: () async {
            return print(await prompt(
              context,
              title: const Text('Would you like to remove?'),
              initialValue: 'Sure',
              isSelectedInitialValue: false,
              textOK: const Text('Yes'),
              textCancel: const Text('No'),
              hintText: 'Please write reason',
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              minLines: 2,
              maxLines: 3,
              autoFocus: false,
              obscureText: true,
              obscuringCharacter: '*',
              showPasswordIcon: true,
              barrierDismissible: true,
              textCapitalization: TextCapitalization.words,
            ));
          },
        ),
      ),
    );
  }
}
