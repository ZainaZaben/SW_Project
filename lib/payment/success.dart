import 'package:flutter/material.dart';
import 'package:flutter_project_1st/homepage/hidden_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:open_file/open_file.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({
    Key? key,
    required this.ispayFromSlides,
    required this.pdfFilePath,
  }) : super(key: key);

  final bool ispayFromSlides;
  final String pdfFilePath;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.ispayFromSlides) {
      _launchURL(); // Call the _launchURL function
    }

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HiddenDrawer(
            page: 0,
          ),
        ),
      );
    });
  }

  void _launchURL() async {
    try {
      await OpenFile.open(widget.pdfFilePath);
    } catch (e) {
      print('Error opening file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/success.json',
          width: 200,
          height: 300,
        ),
      ),
    );
  }
}
