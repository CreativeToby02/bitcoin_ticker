import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<String> cryptoBank() {
    List<String> currencyItems = [];
    for (String crypto in cryptoList) {
      currencyItems.add(crypto);
    }
    return currencyItems;
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;

          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          //1: Save the selected currency to the property selectedCurrency
          selectedCurrency = currenciesList[selectedIndex];
          //2: Call getData() when the picker/dropdown changes.
          getData();
        });
      },
      children: pickerItems,
    );
  }

  String bitcoinValue = '?';

  void getData() async {
    try {
      //We're now passing the selectedCurrency when we call getCoinData().
      var data = await CoinData().getCoinData(selectedCurrency);
      setState(() {
        bitcoinValue = data;
      });
    } catch (e) {
      print(e);
    }
  }

  //TODO: Create a method here called getData() to get the coin data from coin_data.dart

  @override
  void initState() {
    super.initState();
    getData();
    //TODO: Call getData() when the screen loads up.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 0),
            child: Column(
              children: [
                buildCard(
                    '1 ${cryptoBank()[0]} = $bitcoinValue $selectedCurrency'),
                SizedBox(height: 3),
                buildCard(
                    '1 ${cryptoBank()[1]} = $bitcoinValue $selectedCurrency'),
                SizedBox(height: 3),
                buildCard(
                    '1 ${cryptoBank()[2]} =  $bitcoinValue $selectedCurrency'),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }

  Card buildCard(
    String money,
  ) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 98.0),
        child: Text(
          //TODO: Update the Text Widget with the live bitcoin data here.
          money,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//'1 BTC = $currencyRate USD'
