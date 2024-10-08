// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'template/globals.dart';

void main() {
  runApp(const HumblerookiePluginExample());
}

/// A Flutter application demonstrating the functionality of this plugin
class HumblerookiePluginExample extends StatelessWidget {
  const HumblerookiePluginExample({super.key});

  @override
  Widget build(BuildContext context) {
    /// [MaterialColor] to be used in the app [ThemeData]
    final MaterialColor themeMaterialColor =
        createMaterialColor(const Color.fromRGBO(48, 49, 60, 1));
    return MaterialApp(
      title: 'Humblerookie $pluginName',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: themeMaterialColor.shade500,
          disabledColor: themeMaterialColor.withRed(200),
          splashColor: themeMaterialColor.shade50,
          textTheme: ButtonTextTheme.primary,
        ),
        hintColor: themeMaterialColor.shade500,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.3,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 18,
            height: 1.2,
          ),
          labelLarge: TextStyle(color: Colors.white),
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color.fromRGBO(37, 37, 37, 1),
          filled: true,
        ),
        bottomAppBarTheme:
            const BottomAppBarTheme(color: Color.fromRGBO(57, 58, 71, 1)),
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch:
                    createMaterialColor(const Color.fromRGBO(48, 49, 60, 1)))
            .copyWith(primary: const Color.fromRGBO(48, 49, 60, 0.8))
            .copyWith(secondary: Colors.white60),
      ),
      home: const AppHome(title: 'Baseflow $pluginName example app'),
    );
  }

  /// Creates a [MaterialColor] based on the supplied [Color]
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final r = color.red, g = color.green, b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch as Map<int, Color>);
  }
}

/// A Flutter example demonstrating how the [pluginName] plugin could be used
class AppHome extends StatefulWidget {
  /// Constructs the [AppHome] class
  const AppHome({Key? key, this.title}) : super(key: key);

  /// The [title] of the application, which is shown in the application's
  /// title bar.
  final String? title;

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  static final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        title: const Center(
          child: Text("OptimizedCachedImage"),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      elevation: 5,
      color: Theme.of(context).bottomAppBarTheme.color,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.unmodifiable(() sync* {
          for (var i = 0; i < pages.length; i++) {
            yield Expanded(
              child: IconButton(
                iconSize: 30,
                icon: Icon(icons.elementAt(i)),
                color: _bottomAppBarIconColor(i),
                onPressed: () => _animateToPage(i),
              ),
            );
          }
        }()),
      ),
    );
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  Color _bottomAppBarIconColor(int page) {
    return _currentPage == page
        ? Colors.white
        : Theme.of(context).colorScheme.secondary;
  }
}
