import 'package:flutter/material.dart';
import 'package:test_flutter/models/quote.dart';

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({Key? key}) : super(key: key);

  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  List<Quote> quotes = [
    Quote(author: 'Farid', text: 'In Sobata chie dg !'),
    Quote(author: 'Masood', text: 'Jam knin baba!'),
    Quote(author: 'Amin', text: 'Bashe hala ch khabaretune !')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: quotes
          .map((q) => QuoteCard(
                quote: q,
                delete: () {
                  setState(() {
                    quotes.remove(q);
                  });
                },
              ))
          .toList(),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  const QuoteCard({Key? key, required this.quote, required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                quote.text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                quote.author,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 6.0),
              IconButton(
                  onPressed: () => delete(), icon: const Icon(Icons.delete))
            ],
          ),
        ));
  }
}
