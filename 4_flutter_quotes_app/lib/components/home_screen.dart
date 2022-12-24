import 'package:flutter/material.dart';
import 'add_quote_screen.dart';
import 'quote.dart';
import 'quote_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Quote> quotes = [
    Quote(
        quote: "Be yourself everyone else is already taken",
        author: "Oscar Wilde",
        picurl:
            "https://ichef.bbci.co.uk/news/640/amz/worldservice/live/assets/images/2009/12/31/091231141326_oscar226.jpg"),
    Quote(
        quote:
            "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
        author: "Albert Einstein",
        picurl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3IVB4rS3XM6oLKKZMVZLJWfPiNkxwIH9W__T1g852&s"),
    Quote(
        quote:
            "Don’t walk in front of me… I may not follow. Don’t walk behind me… I may not lead. Walk beside me… just be my friend",
        author: "Albert Camus",
        picurl:
            "https://i.dr.com.tr/pimages/Content/Uploads/ArtistImages/artist__260259.jpg"),
  ];
  Color? color1 = const Color.fromARGB(255, 86, 146, 236);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        foregroundColor: Colors.white70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: color1,
        title: const Text("Quotes"),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white70,
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddQuote(
                        quotes: quotes,
                        color1: color1,
                      )));

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: quotes.map(
            (quote) {
              return QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
