import 'package:flutter/material.dart';
import 'quote.dart';

class AddQuote extends StatefulWidget {
  final List<Quote> quotes;
  final Color? color1;

  const AddQuote({super.key, required this.quotes, required this.color1});

  @override
  State<AddQuote> createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  late String newquote;
  late String newauthor;
  String newpicurl =
      "https://i2-prod.stokesentinel.co.uk/news/article977212.ece/ALTERNATES/s615b/Edwardian-gentleman2.jpg";
  late Quote quote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white70,
        title: const Text("Add New Quote"),
        backgroundColor: widget.color1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  newquote = value;
                });
              },
              decoration: const InputDecoration(hintText: "Quote"),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  newauthor = value;
                });
              },
              decoration: const InputDecoration(hintText: "Author"),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  newpicurl = value;
                });
              },
              decoration: const InputDecoration(hintText: "Picture Url"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  try {
                    setState(() {
                      quote = Quote(
                          quote: newquote,
                          author: newauthor,
                          picurl: newpicurl);
                      widget.quotes.add(quote);
                      Navigator.pop(context);
                    });
                  } catch (e) {
                    null;
                  }
                },
                child: const Text("Add Quote")),
          ],
        ),
      ),
    );
  }
}
