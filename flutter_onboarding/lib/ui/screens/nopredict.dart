import 'package:flutter/material.dart';
import '../../constants.dart';

class NopredictPage extends StatefulWidget {
  const NopredictPage({Key? key}) : super(key: key);

  @override
  State<NopredictPage> createState() => _NopredictPageState();
}

class _NopredictPageState extends State<NopredictPage> {
  String responseMessage =
      "Oops! 😅 Our plant recognition model couldn't confidently identify the plant in your image (prediction score < 70%). We currently support 10 varieties, and we apologize for any inconvenience. Please make sure the image is clear and try again. Your feedback is crucial as we continue to enhance our model. Thank you for your understanding and patience! 🌱 #PlantRecognition #TryAgain";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            const SizedBox(width: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Constants.primaryColor.withOpacity(.15),
                ),
                child: Icon(
                  Icons.close,
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              responseMessage,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Constants.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
