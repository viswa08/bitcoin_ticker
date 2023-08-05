import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'services/bitcoin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropdownValue = currenciesList.first;
  int bitcoinVal = 0;

  @override
  void initState() {
    super.initState();
    getBitcoinUsdData();
  }

  void getBitcoinUsdData() async {
    var val = await BitcoinModel().getBitcoinUSDData();
    bitcoinVal = val["rate"].toInt();
    setState(() {});
  }

  void getBitcoinData(String? currency) async {
    var val = await BitcoinModel().getBitcoinData(currency);
    bitcoinVal = val["rate"].toInt();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitcoinVal $dropdownValue',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
                value: dropdownValue,
                items: currenciesList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  getBitcoinData(value);
                  setState(() {
                    dropdownValue = value!;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
