part of 'main.dart';

Route<dynamic> _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BooksScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext context) => const BooksScreen(),
      );
    case BookDetailScreen.routeName:
      final args = settings.arguments as BookDetailScreenArguments;
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (BuildContext context) => BookDetailScreen(
          args: args,
        ),
      );
    default:
      throw ArgumentError.value(
        settings.name,
        'settings.name',
        'Unsupported route',
      );
  }
}
