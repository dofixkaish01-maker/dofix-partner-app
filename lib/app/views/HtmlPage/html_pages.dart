import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlContentScreen extends StatelessWidget {
  final String title;
  final String htmlContent;

  const HtmlContentScreen({
    Key? key,
    required this.title,
    required this.htmlContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),backgroundColor: Color(0xff337BA0),),
      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(2.0),
      //   // child: Html(data: htmlContent),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Html(
          data: htmlContent,
          style: {
            "*": Style(
              margin: Margins.zero,
              padding: HtmlPaddings.zero,
              lineHeight: LineHeight(1.8),
            ),
          },
        ),
      ),

    );
  }
}
