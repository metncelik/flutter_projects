import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function() delete;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        color: const Color.fromARGB(255, 227, 223, 212),
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(quote.picurl),
          ),
          trailing: IconButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: delete,
              icon: const Icon(Icons.delete)),
          title: Text('"${quote.quote}"'),
          subtitle: Text('- ${quote.author}'),
        ),
      ),
    );
  }
}
