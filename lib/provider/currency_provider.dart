import 'package:flutter/foundation.dart';

import '../models/currency_model.dart';
import '../services/currency_service.dart';

class CurrencyProvider extends ChangeNotifier{
   List<CurrencyModel> currencyList = [];  
  bool isLoading = false;
  double totalSum = 0;
  CurrencyProvider(){
    getCurrency();
  }

  changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }

  getCurrency() async{
      changeLoading() ;
      CurrencyServices.getCurrrensies().then((value) async{
       await Future.delayed(const Duration(seconds: 3));
      currencyList = value;
      changeLoading() ;
    });
  }

  
  void checkTotalSum(){
    for(var currency in currencyList){
      totalSum += double.parse(currency.rate!);
    }
    notifyListeners();
  }
}