import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:covid19_tracker/model/countries.dart';
import 'package:covid19_tracker/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OurSearchDelegate extends SearchDelegate {
  final List<Countries> countriesList;

  OurSearchDelegate({this.countriesList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear_all),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: countriesList
          .where((element) =>
          element.country.toLowerCase().contains(query.toLowerCase()))
          .map<Widget>(
            (e) => ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryScreen(country: e,),
              )),
          title: Text(e.country),
          leading: e.countryCode.length == 2
              ? CountryPickerUtils.getDefaultFlagImage(
              Country(isoCode: e.countryCode))
              : Text(""),
          subtitle: Text("${formatter.format(e.confirmed)}"),
        ),
      )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: countriesList
          .where((element) =>
              element.country.toLowerCase().contains(query.toLowerCase()))
          .map<Widget>(
            (e) => ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryScreen(country: e,),
                  )),
              title: Text(e.country),
              leading: e.countryCode.length == 2
                  ? CountryPickerUtils.getDefaultFlagImage(
                      Country(isoCode: e.countryCode))
                  : Text(""),
              subtitle: Text("${formatter.format(e.confirmed)}"),
            ),
          )
          .toList(),
    );
  }

  final formatter = NumberFormat.decimalPattern('en-US');
}
