import 'package:animtaions_ba/ui/task/animated_task.dart';
import 'package:animtaions_ba/constants/app_assets.dart';
import 'package:animtaions_ba/constants/app_colors.dart';
import 'package:animtaions_ba/theming/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color.fromARGB(255, 177, 91, 0)),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: AppTheme(
          data: AppThemeData.defaultWithSwatch(AppColors.red), child: Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 240,
          height: 240,
          child: AnimatedTask(iconName: AppAssets.dog),
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomColumn(
//       children: const [
//         Spacer(),
//         Padding(
//           padding: EdgeInsets.all(16),
//           child: Text(
//             "A definitive guide to\n RenderObjects in Flutter",
//             style: TextStyle(fontSize: 32),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(16),
//           child: Text(
//             "by Behzad Ayubifar",
//             textAlign: TextAlign.center,
//           ),
//         ),
//         Spacer(),
//       ],
//     );
//   }
// }