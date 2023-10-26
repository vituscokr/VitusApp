import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestGoogleFontsPage extends StatefulWidget {
  const TestGoogleFontsPage({super.key});

  @override
  State<TestGoogleFontsPage> createState() => _TestGoogleFontsPageState();
}

class _TestGoogleFontsPageState extends State<TestGoogleFontsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          children: [

              Text("Test 테스트 ",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.abel(textStyle: Theme.of(context).textTheme.bodyLarge)
                                ),
            Text("Test 테스트 ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.aBeeZee(textStyle: Theme.of(context).textTheme.bodyLarge)
            ),
          ],
        ),
      )
    );
  }
}
