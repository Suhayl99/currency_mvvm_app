import 'package:currency_mvvm_app/custom_widget/text_comp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/currency_provider.dart';
import './cart_view_model.dart';
  
class CartView extends CartViewModel {
    
  @override
  Widget build(BuildContext context) {
    
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextUzs("TOTAL SUM : ${context.watch<CurrencyProvider>().totalSum.toStringAsFixed(2)}"),
      ),
    );
  }
}

