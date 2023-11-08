import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  // system UI
  static const String check = 'assets/check.svg';
  static const String plus = 'assets/plus.svg';
  static const String threeDots = 'assets/three-dots.svg';
  static const String delete = 'assets/delete.svg';
  static const String navigationClose = 'assets/navigation-close.svg';
  static const String navigationBack = 'assets/navigation-back.svg';

  // tasks
  static const String basketball = 'assets/basketball-ball.svg';
  static const String beer = 'assets/beer.svg';
  static const String bike = 'assets/bike.svg';
  static const String book = 'assets/book.svg';
  static const String carrot = 'assets/carrot.svg';
  static const String chef = 'assets/chef.svg';
  static const String dentalFloss = 'assets/dental-floss.svg';
  static const String dog = 'assets/dog.svg';
  static const String dumbell = 'assets/dumbell.svg';
  static const String guitar = 'assets/guitar.svg';
  static const String homework = 'assets/homework.svg';
  static const String html = 'assets/html-coding.svg';
  static const String karate = 'assets/karate.svg';
  static const String mask = 'assets/mask.svg';
  static const String meditation = 'assets/meditation.svg';
  static const String painting = 'assets/paint-board-and-brush.svg';
  static const String phone = 'assets/phone.svg';
  static const String pushups = 'assets/pushups-man.svg';
  static const String rest = 'assets/rest.svg';
  static const String run = 'assets/run.svg';
  static const String smoking = 'assets/smoking.svg';
  static const String stretching = 'assets/stretching-exercises.svg';
  static const String sun = 'assets/sun.svg';
  static const String swimmer = 'assets/swimmer.svg';
  static const String toothbrush = 'assets/toothbrush.svg';
  static const String vitamins = 'assets/vitamins.svg';
  static const String washHands = 'assets/wash-hands.svg';
  static const String water = 'assets/water.svg';

  static const List<String> allTaskIcons = <String>[
    basketball,
    beer,
    bike,
    book,
    carrot,
    chef,
    dentalFloss,
    dog,
    dumbell,
    guitar,
    homework,
    html,
    karate,
    mask,
    meditation,
    painting,
    phone,
    pushups,
    rest,
    run,
    smoking,
    stretching,
    sun,
    swimmer,
    toothbrush,
    vitamins,
    washHands,
    water,
  ];

  static Future<void> preloadSVGs() async {
    final assets = <String>[
      // system UI
      check,
      plus,
      threeDots,
      delete,
      navigationClose,
      navigationBack,
      // tasks
      ...allTaskIcons,
    ];
    for (final asset in assets) {
      await precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, asset),
        null,
      );
    }
  }
}
