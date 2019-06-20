import 'package:flutter/material.dart';
import 'package:glina_soundboard/funkcje/dodaj_do_ulubionych.dart';
import 'package:glina_soundboard/funkcje/odtworz_dzwiek.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Ulubione extends StatefulWidget {
  @override
  _UlubioneState createState() => _UlubioneState();
}

class _UlubioneState extends State<Ulubione> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulubione'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
        itemCount: dlugoscListy,
        itemBuilder: (context, index) {
          final numer = ulubioneInty[index];
          final opis = ulubioneOpisy[index];
          return Slidable(
            child: Container(
              child: ListTile(
                title: Text(opis),
                leading: Icon(Icons.play_arrow),
                onTap: () {
                  odtworzDzwiek(numer);
                },
              ),
            ),
            delegate: SlidableDrawerDelegate(),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Usuń',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  usunZUlubionych(numer, opis);
                  super.setState(() {});
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
