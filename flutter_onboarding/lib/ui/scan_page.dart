// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/nopredict.dart';
import 'package:flutter_onboarding/ui/screens/predict_page.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import '../../models/plants.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  File? _image;
  final picker = ImagePicker();
  List<Plant> ourplantList = Plant.plantList;
  bool isImagepickeractive = true;
  bool showButton = false;

  Future getImage() async {
    final pickedFile = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          actions: [
            Column(
              children: [
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.gallery),
                  child: Row(
                    children: [
                      Icon(Icons.photo,
                          color: Constants.primaryColor), // Gallery Icon
                      SizedBox(width: 8),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: Constants.blackColor.withOpacity(.7),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.camera),
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt,
                          color: Constants.primaryColor), // Camera Icon
                      SizedBox(width: 8),
                      Text(
                        "Camera",
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: Constants.blackColor.withOpacity(.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );

    if (pickedFile != null) {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(
        source: pickedFile,
        imageQuality: 80,
      );

      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
          showButton = true;
        });
      } else {
        print('No image selected');
        // Handle case when no image is picked
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("No Image Selected"),
              content: Text("Please select an image to proceed."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      print('User canceled image selection');
      // Handle case when user cancels image selection
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("User cancelled image selection"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Future uploadImageAndPredict(File? image) async {
    if (image == null) {
      print('No image selected');
      return;
    }

    // Replace with your Django API endpoint

    //ngrok bata garda
    var apiUrl =
        Uri.parse('https://c106-120-89-104-33.ngrok-free.app/predict/');

    //emulator bata garda
    //var apiUrl = Uri.parse('http://10.0.2.2:8000/predict/');
    

    // Create a multipart request
    var request = http.MultipartRequest('POST', apiUrl);

    // Attach the image file to the request
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      image.path,
      contentType:
          MediaType('image', 'jpeg'), // Adjust the content type as needed
    ));

    // Send the request
    try {
      var response = await request.send();
      print(response.statusCode);

      if (response.statusCode == 200) {
        // Capture the response as a string
        print('Image uploaded successfully!');
        final _responseText = await response.stream.bytesToString();
        print(_responseText);
        //String responseBody = await response.stream.bytesToString();
        /*setState(() {
          _responseText = responseBody;
        });*/
        // Decode the response JSON
        Map<String, dynamic> responseData = json.decode(_responseText);
        String predictedName = responseData["prediction"];
        double confidence = responseData["confidence"];

        // Store confidence in ConfidenceStorage class
        ConfidenceStorage.confidence = confidence;

        for (Plant plant in ourplantList) {
          print(predictedName);
          print(confidence);
          if (plant.plantName == predictedName) {
            Navigator.push(
              context,
              PageTransition(
                child: PredictPage(plantid: plant.plantId),
                type: PageTransitionType.bottomToTop,
              ),
            );
          }
        }
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        if (response.statusCode == 404) {
          Navigator.push(
            context,
            PageTransition(
              child: NopredictPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        }
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 100),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Card(
                  elevation: 2,
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: SizedBox(
                          height:
                              250, // Set a fixed height for the image container
                          width:
                              250, // Set a fixed width for the image container
                          child: _image != null
                              ? Image.file(
                                  _image!.absolute,
                                  fit: BoxFit
                                      .cover, // Adjust fit to control how the image is inscribed
                                )
                              : Icon(
                                  Icons.image,
                                  size: 150,
                                  color: Constants.primaryColor,
                                ),
                        ),
                      ),
                      if (_image == null)
                        Text(
                          'Tap to select an Image',
                          style: TextStyle(
                            fontSize: 18,
                            color: Constants.blackColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showButton,
              child: ElevatedButton.icon(
                onPressed: () {
                  uploadImageAndPredict(_image);
                },
                label: Text(
                  'Show Predicitions',
                  style: TextStyle(
                    fontSize: 18,
                    color: Constants.primaryColor,
                  ),
                ),
                icon: Icon(
                  Icons.search_rounded,
                  color: Constants.primaryColor,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primaryColor.withOpacity(.10),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfidenceStorage {
  static double confidence = 0.0;
}
