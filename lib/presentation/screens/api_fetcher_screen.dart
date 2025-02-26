import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_api_fetce/BLoc/quote_cubit.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {

  Widget buildBlocWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<QuoteCubit, QuoteState>(
                  builder: (context, state) {
                   if (state is QuoteLoaded && state.quote.isNotEmpty) {
                      return Text(
                        state.quote.first.quote,
                        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return Text(
                        "Press the button to fetch a quote",
                        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<QuoteCubit>(context).getRandomQuote();
            },
            child: Text("Get New Quote"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple.shade50,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Random Quote")),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildBlocWidget(),
        ),
      ),
    );
  }
}
