import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokec_assignment/app/book_detail/bloc/book_detail_bloc.dart';
import 'package:pokec_assignment/app/book_detail/book_detail_screen.dart';
import 'package:pokec_assignment/app/book_detail/ports/book_detail_http_client.dart';
import 'package:pokec_assignment/app/book_detail/ports/book_detail_service.dart';
import 'package:pokec_assignment/app/books/bloc/books_bloc.dart';
import 'package:pokec_assignment/app/books/books_screen.dart';
import 'package:pokec_assignment/app/books/ports/books_http_client.dart';
import 'package:pokec_assignment/app/books/ports/books_service.dart';

part 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BooksBloc(
            booksService: BooksService(
              BooksHttpClient(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => BookDetailBloc(
            BookDetailService(
              BookDetailHttpClient(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'IT books',
        theme: ThemeData(
          primaryColor: const Color(0xFF2596BE),
        ),
        onGenerateRoute: _generateRoute,
        home: const BooksScreen(),
      ),
    );
  }
}
