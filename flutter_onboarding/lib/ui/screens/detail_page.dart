// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/plants.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsFavorited(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
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
                        _plantList[widget.plantId].isFavorated);
                    _plantList[widget.plantId].isFavorated = isFavorited;
                  });
                },
                icon: Icon(
                  _plantList[widget.plantId].isFavorated
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
                        image: AssetImage(_plantList[widget.plantId].imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
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
                  _plantList[widget.plantId].plantName,
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
                  _plantList[widget.plantId].scientificname.toString(),
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
                  'Distribution: ' + _plantList[widget.plantId].distribution,
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
                  r'Parts Used:  ' + _plantList[widget.plantId].partsused,
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
                      _plantList[widget.plantId].medicinalvalue,
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
                  r'Description:  ' + _plantList[widget.plantId].decription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    color: Constants.blackColor.withOpacity(.7),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class PlantFeature extends StatelessWidget {
//   final String plantFeature;
//   final String title;
//   const PlantFeature({
//     Key? key,
//     required this.plantFeature,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Constants.blackColor,
//           ),
//         ),
//         Text(
//           plantFeature,
//           style: TextStyle(
//             color: Constants.primaryColor,
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//           ),
//         )
//       ],
//     );
//   }
// }
