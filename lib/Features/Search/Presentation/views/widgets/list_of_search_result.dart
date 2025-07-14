import 'package:flutter/material.dart';

class ListOfSearchResult extends StatelessWidget {
  const ListOfSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const Text('data');
          //const BookListViewItem(bookModel: , ),
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: 10);
  }
}
