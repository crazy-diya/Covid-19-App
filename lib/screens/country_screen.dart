import 'package:covid19_tracker/model/countries.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryScreen extends StatelessWidget {
  final Countries country;

  CountryScreen({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.country),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.network(
              'https://www.countryflags.io/${country.countryCode}/flat/64.png',
              width: MediaQuery.of(context).size.width / 3,
              fit: BoxFit.fill,
            ),
          ),
          buildDetailText(
              color: Colors.black, count: country.confirmed, text: 'Confirmed'),
          buildDetailText(
              color: Colors.blue, count: country.active, text: 'Active'),
          buildDetailText(
              color: Colors.green, count: country.recovered, text: 'Recovered'),
          buildDetailText(
              color: Colors.red, count: country.deaths, text: 'Deaths'),
        ],
      ),
    );
  }

  Widget buildDetailText({int count, Color color, String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        title: Text(
          "$text",
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("${formatter.format(count)}"),
      ),
    );
  }

  final formatter = NumberFormat.decimalPattern('en-US');
}
