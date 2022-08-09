import 'dart:io';
import 'package:currency_mvvm_app/provider/currency_provider.dart';
import 'package:currency_mvvm_app/screen/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../custom_widget/text_comp.dart';
import './home_view_model.dart';

  
class HomeView extends HomeViewModel {
    
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CurrencyProvider(),
      child: myScaffold(context),);
  }

  Scaffold myScaffold ( BuildContext context) {
    var data = context.watch<CurrencyProvider>();
     String appBarStatus = data.totalSum.toStringAsFixed(2);
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title:  Text(appBarStatus),
    ),
    body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SizedBox(
        child: data.isLoading ? const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue ),
          ),
        ) : ListView.builder(itemBuilder: (_, index){
              return ListTile(
                title: Text(data.currencyList[index].ccyNmUZC!),
                trailing: TextUzs(data.currencyList[index].rate!),
                leading: CircleAvatar( child: Text(data.currencyList[index].ccy!),),
              );
          },
              itemCount: data.currencyList.length,
          ),
      )
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: data.isLoading ? Colors.grey : Colors.blue,
      onPressed: data.isLoading? null : (){
        data.checkTotalSum();
      Navigator.push(context, MaterialPageRoute(builder: (_) => Cart()));
    },
    child: const Icon(Icons.navigate_next),),
  );
  } 
  

}

