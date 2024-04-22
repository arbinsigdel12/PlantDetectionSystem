class Plant {
  final int plantId;
  final String scientificname;
  final String distribution;
  final double rating;
  final String partsused;
  final String medicinalvalue;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
      required this.scientificname,
      required this.category,
      required this.plantName,
      required this.distribution,
      required this.rating,
      required this.partsused,
      required this.medicinalvalue,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        scientificname: 'Aloe barbadensis',
        category: 'Garden',
        plantName: 'Aloevera',
        distribution: 'Naturalized(15-2000m) East to West',
        rating: 4.8,
        partsused: 'Entire Plant',
        medicinalvalue: 'Astringent Diuretic',
        imageURL: 'assets/images/Aloevera.jpg',
        isFavorated: false,
        decription:
            'Aloe Vera plants typically have thick, fleshy green leaves that are filled with a gel-like substance. The leaves have serrated edges and can grow in a rosette pattern.',
        isSelected: false),
    Plant(
        plantId: 1,
        scientificname: 'Bambusa vulgaris',
        category: 'Outdoor',
        plantName: 'Bamboo',
        distribution: 'Cultivated/ Naturalized(15-4000m)',
        rating: 4.7,
        partsused: 'Shoots, Leaves, Sap',
        medicinalvalue: 'Detoxification, Anti-inflammatory, Anti-oxidant',
        imageURL: 'assets/images/Bamboo.jpg',
        isFavorated: false,
        decription:
            'Bamboo is a fast-growing grass characterized by tall, hollow stems with segmented nodes. It is versatile, used in construction, furniture, food (like bamboo shoots), and landscaping. With over 1,500 species worldwide, bamboo plays a vital role in ecology and offers various practical applications.',
        isSelected: false),
    Plant(
        plantId: 2,
        scientificname: 'Piper betle',
        category: 'Outdoor',
        plantName: 'Betel',
        distribution: 'Large',
        rating: 4.1,
        partsused: 'Root, Leaf, Fruit',
        medicinalvalue:
            'Digestive, Oral health, Respiratory, Wounds, Anti-diabetic, Anti-inflammatory',
        imageURL: 'assets/images/Betel.jpg',
        isFavorated: false,
        decription:
            'A perennial climber.Leaves simple, alternate, stalked, broadly ovate, slightly cordate,15-20cm long,shortly acuminate, entire, glabrous, shining.',
        isSelected: false),
    Plant(
        plantId: 3,
        scientificname: 'Psidium guajava',
        category: 'Outdoor',
        plantName: 'Guava',
        distribution: 'Cultivated',
        rating: 4.2,
        partsused: 'Leaf',
        medicinalvalue: 'Bowels Wound \n Cholera',
        imageURL: 'assets/images/Guava.jpg',
        isFavorated: false,
        decription:
            'The guava plant (Psidium guajava) is a tropical evergreen tree known for its distinctive features and versatile uses. Displaying a dense canopy of dark green, glossy leaves, guava trees vary in size from small shrubs to medium-sized trees.',
        isSelected: false),
    Plant(
        plantId: 4,
        scientificname: 'Mentha spicata',
        category: 'Outdoor',
        plantName: 'Mint',
        distribution: 'Cultivated',
        rating: 4.4,
        partsused: 'Leaves, Flower',
        medicinalvalue:
            'Digestive, Relief from IBS, Respiratory, Headache, Oral health',
        imageURL: 'assets/images/Mint.jpg',
        isFavorated: false,
        decription:
            'Mint offers a range of medicinal benefits, including aiding digestion, relieving respiratory issues, soothing headaches, promoting oral health, calming skin irritation, and reducing stress, due to its anti-inflammatory, antibacterial, and soothing properties, making it a versatile herb for enhancing health and well-being.',
        isSelected: false),
    Plant(
        plantId: 5,
        scientificname: 'Azadirachta indica',
        category: 'Outdoor',
        plantName: 'Neem',
        distribution: '0-1500m,East to West',
        rating: 4.5,
        partsused: 'Bark, Leaves, Seed, Twigs',
        medicinalvalue:
            'Anti-bacterial, Anti-fungal, Anti-viral, Anti-inflammatory, Oral health, Digestive, Wounds',
        imageURL: 'assets/images/Neem.jpg',
        isFavorated: false,
        decription:
            'Neem offers extensive medicinal value with its antibacterial, antifungal, antiviral, and anti-inflammatory properties. Widely used in skincare, oral hygiene, and immune support, neem is celebrated for its role in treating infections, promoting wound healing, and enhancing overall health.',
        isSelected: false),
    Plant(
        plantId: 6,
        scientificname: 'Carica papaya',
        category: 'Garden',
        plantName: 'Papaya',
        distribution: '1000-1200m,East to West',
        rating: 4.7,
        partsused: 'Leaf, Fruit, Seed',
        medicinalvalue:
            'Digestive, Eye health, Wounds, Immune support, Cardiovascular, Anti-parasitic, Menstrual Regulation.',
        imageURL: 'assets/images/Papaya.jpg',
        isFavorated: false,
        decription:
            'Papaya is rich in enzymes, antioxidants, and vitamins, aids digestion, supports immune function, promotes wound healing, enhances skin health, and contributes to heart and eye health. With its anti-inflammatory and anti-parasitic properties, papaya serves as a versatile fruit offering a range of health benefits.',
        isSelected: false),
    Plant(
        plantId: 7,
        scientificname: 'Punica granatum',
        category: 'Outdoor',
        plantName: 'Pomegranate',
        distribution: 'Cultivated',
        rating: 4.5,
        partsused: 'Root,Stem bark, Fruit rind,Seed',
        medicinalvalue: 'Diarrhea,Dysentry,Astringent,Anthelmintic',
        imageURL: 'assets/images/download.jpg',
        isFavorated: false,
        decription:
            'A spiny decidious tree of 5-10m in height.Flowers bright red, rarely white with thick '
            'fleshy petals',
        isSelected: false),
    Plant(
        plantId: 8,
        scientificname: 'Rosa Rubiginosa',
        category: 'Garden',
        plantName: 'Rose',
        distribution: 'Cultivated',
        rating: 4.5,
        partsused: 'Petals, Leaves',
        medicinalvalue:
            'Calming effect, Helps with cold, flu, insomnia, Digestive health, Skin care',
        imageURL: 'assets/images/Rose.jpg',
        isFavorated: false,
        decription:
            'Roses, with their elegant blooms and delicate fragrance, not only add beauty to gardens and floral arrangements but also offer a multitude of practical uses, from soothing skincare to immune-boosting remedies and aromatic relaxation aids, making them a versatile and cherished botanical treasure.',
        isSelected: false),
    Plant(
        plantId: 9,
        scientificname: 'Ocimum tenuiflorum',
        category: 'Garden/Outdoor',
        plantName: 'Tulsi',
        distribution: 'Small',
        rating: 4.5,
        partsused: 'Leaves, Seeds, Roots',
        medicinalvalue:
            'Cardiovascular, Stress Relief, Anti-microbial, Respiratory, Anti-inflammatory, Immune Boost',
        imageURL: 'assets/images/Tulsi.jpg',
        isFavorated: false,
        decription:
            'Tulsi, also known as Holy Basil, represents a revered herb within the Ocimum genus, cherished for its multifaceted roles in culinary, medicinal, and spiritual practices. Its rich history and diverse applications make it a prominent and highly valued species among the various basil varieties.',
        isSelected: false),
    // Plant(
    // plantId: 12,
    // scientificname: 'Pongamia Pinnata',
    // category: 'Outdoor',
    // plantName: 'Kaarengee',
    // distribution: 'Cultivated',
    // rating: 4.5,
    // partsused: 'seed',
    // medicinalvalue: 'Skin disease,Herpes,Scabies,Rheumatism',
    // imageURL: 'assets/images/pongamia.jpg',
    // isFavorated: false,
    // decription:
    //     'Oops! 😅 Our plant recognition model couldn't identify the plant in your image.
    //We currently support 12 varieties, and we're sorry for any inconvenience.
    //Please ensure the image is clear and try again.
    //Your feedback is valuable as we continue to update and expand our model.
    //Thank you for your understanding! 🌱 #PlantRecognition #TryAgain',
    // isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }
}

// Oops! 😅 Our plant recognition model couldn't confidently identify the plant in your image (prediction score < 50%). We currently support 12 varieties, and we apologize for any inconvenience. Please make sure the image is clear and try again. Your feedback is crucial as we continue to enhance our model. Thank you for your understanding and patience! 🌱 #PlantRecognition #TryAgain
