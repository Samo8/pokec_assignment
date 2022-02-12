import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokec_assignment/app/book_detail/book_detail_screen.dart';
import 'package:pokec_assignment/app/books/bloc/books_bloc.dart';

class BooksScreen extends StatefulWidget {
  static const routeName = '/books';

  const BooksScreen({Key? key}) : super(key: key);

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final bookTextController = TextEditingController();
  late final BooksBloc booksBloc;

  @override
  void initState() {
    booksBloc = BlocProvider.of<BooksBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT books'),
      ),
      body: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: bookTextController,
                  decoration: InputDecoration(
                    hintText: 'Book name',
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                        booksBloc.add(
                          FetchBooksEvent(
                            text: bookTextController.text,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: state.booksInfo.books.isEmpty
                    ? const Center(
                        child: Text(
                          'No books found',
                        ),
                      )
                    : LazyLoadScrollView(
                        onEndOfPage: () {
                          booksBloc.add(
                            FetchBooksPageEvent(
                              text: bookTextController.text,
                              page: state.page + 1,
                            ),
                          );
                        },
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            final book = state.booksInfo.books[index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 4.0,
                              ),
                              child: Card(
                                child: InkWell(
                                  child: ListTile(
                                    leading: Image.network(
                                      book.image,
                                      loadingBuilder: (_, child,
                                              loadingProgress) =>
                                          loadingProgress != null
                                              ? const CircularProgressIndicator()
                                              : child,
                                    ),
                                    title: Text(book.title),
                                    subtitle: Text(book.subtitle),
                                    trailing: Text(book.price),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      BookDetailScreen.routeName,
                                      arguments: BookDetailScreenArguments(
                                        title: book.title,
                                        isbn: book.isbn,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          itemCount: state.booksInfo.books.length,
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
