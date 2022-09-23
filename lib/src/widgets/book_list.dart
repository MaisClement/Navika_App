import 'package:flutter/material.dart';

import '../data.dart';

class BookList extends StatelessWidget {
	final List<Book> books;
	final ValueChanged<Book>? onTap;

	const BookList({
		required this.books,
		this.onTap,
		super.key,
	});

	@override
	Widget build(BuildContext context) => ListView.builder(
				itemCount: books.length,
				itemBuilder: (context, index) => ListTile(
					title: Text(
						books[index].title,
					),
					subtitle: Text(
						books[index].author.name,
					),
					onTap: onTap != null ? () => onTap!(books[index]) : null,
				),
			);
}
