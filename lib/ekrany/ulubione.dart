import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../funkcje/dodaj_do_ulubionych.dart';
import '../funkcje/odtworz_dzwiek.dart';

class Ulubione extends StatefulWidget {
  @override
  _UlubioneState createState() => _UlubioneState();
}

class _UlubioneState extends State<Ulubione> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulubione'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(color: Colors.pink),
        itemCount: dlugoscListy,
        itemBuilder: (context, index) {
          final numer = ulubioneInty[index];
          final opis = ulubioneOpisy[index];
          return Slidable(
            child: Container(
              child: ListTile(
                title: Text(opis),
                leading: const Icon(Icons.play_arrow),
                onTap: () => odtworzDzwiek(numer),
              ),
            ),
            delegate: const SlidableDrawerDelegate(),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Usuń',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  usunZUlubionych(numer, opis);
                  setState(() {});
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
