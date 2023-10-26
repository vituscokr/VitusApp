import 'package:flutter/material.dart';

class TestThemePage extends StatefulWidget {
  const TestThemePage({super.key});

  @override
  State<TestThemePage> createState() => _TestThemePageState();
}

class _TestThemePageState extends State<TestThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body : Column(
        children: [
          Text("aaaaaaaaaa",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge
                            ),
          Text("bbbbbb",
          maxLines: 1,
              overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium),
        ],
      )
    );
  }
}
