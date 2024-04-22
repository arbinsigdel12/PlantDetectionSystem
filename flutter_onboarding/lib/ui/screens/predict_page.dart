// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/scan_page.dart';
import '../../constants.dart';
import '../../models/plants.dart';

class PredictPage extends StatefulWidget {
  final int plantid;
  const PredictPage({Key? key, required this.plantid}) : super(key: key);

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  bool toggleIsFavorited(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    //print('Confidence value: ${ConfidenceStorage.confidence} %');
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;

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
                  color: Constants.blackColor,
                ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              debugPrint('favorite');
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Constants.primaryColor.withOpacity(.15),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    bool isFavorited = toggleIsFavorited(
                        _plantList[widget.plantid].isFavorated);
                    _plantList[widget.plantid].isFavorated = isFavorited;
                  });
                },
                icon: Icon(
                  _plantList[widget.plantid].isFavorated
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Constants.blackColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, bottom: 20, top: 30),
            child: Text(
              'The predicted Plant is:',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, bottom: 20, top: 30),
            child: Text(
              'The confidence is: ${ConfidenceStorage.confidence.toStringAsFixed(2)}',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_plantList[widget.plantid].imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            height: size.height * .5,
            width: size.width,
            decoration: BoxDecoration(
              color: Constants.primaryColor.withOpacity(.4),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _plantList[widget.plantid].plantName,
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _plantList[widget.plantid].scientificname.toString(),
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Distribution: ' + _plantList[widget.plantid].distribution,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    color: Constants.blackColor.withOpacity(.7),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  r'Parts Used:  ' + _plantList[widget.plantid].partsused,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    color: Constants.blackColor.withOpacity(.7),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  r'Medicinal Value:  ' +
                      _plantList[widget.plantid].medicinalvalue,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    color: Constants.blackColor.withOpacity(.7),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  r'Description:  ' + _plantList[widget.plantid].decription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    color: Constants.blackColor.withOpacity(.7),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
