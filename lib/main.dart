import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:random_api_fetce/data/repositories/quote_repo.dart';
import 'package:random_api_fetce/data/web_services/quotes_web_service.dart';
import 'package:random_api_fetce/presentation/screens/api_fetcher_screen.dart';

import 'BLoc/quote_cubit.dart'; // Import your Cubit

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteCubit(quoteRepository: QuoteRepository(quotesWebService: QuotesWebService())), // Provide your Cubit
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuoteScreen(),
      ),
    );
  }
}
