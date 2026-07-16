import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/quotes.dart';
import '../models/quote.dart';

class QuoteProvider extends ChangeNotifier {
  final Random _random = Random();

  late Quote _currentQuote;

  int _currentIndex = -1;

  QuoteProvider() {
    generateQuote();
  }

  Quote get currentQuote => _currentQuote;

  void generateQuote() {
    if (QuotesData.quotes.length == 1) {
      _currentQuote = QuotesData.quotes.first;
      notifyListeners();
      return;
    }

    int index;

    do {
      index = _random.nextInt(QuotesData.quotes.length);
    } while (index == _currentIndex);

    _currentIndex = index;

    _currentQuote = QuotesData.quotes[index];

    notifyListeners();
  }
}
