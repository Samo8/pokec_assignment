import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokec_assignment/app/book_detail/bloc/book_detail_bloc.dart';
import 'package:pokec_assignment/models/book_detail.dart';

class BookDetailScreenArguments extends Equatable {
  final String title;
  final String isbn;

  const BookDetailScreenArguments({
    required this.title,
    required this.isbn,
  });

  @override
  List<Object> get props => [title, isbn];
}

class BookDetailScreen extends StatefulWidget {
  static const routeName = 'book-detail';
  final BookDetailScreenArguments args;

  const BookDetailScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  String get title => widget.args.title;
  String get isbn => widget.args.isbn;
  late final BookDetailBloc bookDetailBloc;

  @override
  void initState() {
    bookDetailBloc = BlocProvider.of<BookDetailBloc>(context);
    bookDetailBloc.add(FetchBookDetailEvent(isbn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<BookDetailBloc, BookDetailState>(
        builder: (context, state) {
          if (state is BookDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BookDetailError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is BookDetailFetched) {
            final book = state.bookDetail;
            return BookDetailBody(book: book);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class BookDetailBody extends StatelessWidget {
  final BookDetail book;
  const BookDetailBody({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                book.title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                book.subtitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Authors: ${book.authors}',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.network(
            book.image,
            height: MediaQuery.of(context).size.width / 1.2,
          ),
          Center(
            child: Text(
              'Price: ${book.price}',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
