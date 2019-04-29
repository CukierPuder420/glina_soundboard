import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const String kluczDni = 'glinasoundboard_dni';
const String kluczWczoraj = 'glinasoundboard_wczoraj';

int iloscDni = 0;
DateTime wczoraj;

void zapiszDate(DateTime czas) async {
	SharedPreferences sp = await SharedPreferences.getInstance();
	String bufor = czas.toIso8601String();
	sp.setString(kluczWczoraj, bufor);
}

Future<DateTime> odczytajDate() async {
	SharedPreferences sp = await SharedPreferences.getInstance();
	if(sp.containsKey(kluczWczoraj)) {
		String bufor = sp.getString(kluczWczoraj);
		DateTime data = DateTime.parse(bufor);
		return data;
	} else {
		DateTime data = DateTime.now();
		zapiszDate(data);
		return data;
	}
}

void zapiszDni(int dni) async {
	SharedPreferences sp = await SharedPreferences.getInstance();
	sp.setInt(kluczDni, dni);
}

Future<int> odczytajDni() async {
	SharedPreferences sp = await SharedPreferences.getInstance();
	if(sp.containsKey(kluczDni)) {
		int bufor = sp.getInt(kluczDni);
		return bufor;
	} else {
		sp.setInt(kluczDni, 0);
		return 0;
	}
}

void usunDni() async {
	if(DateTime.now().isAfter(wczoraj.add(Duration(days: 1, hours: 23)))) {
		iloscDni = 0;
		zapiszDni(iloscDni);
		wczoraj = DateTime.now();
		zapiszDate(wczoraj);
	}
}

void zmienDni() async {
	if((DateTime.now().isBefore(wczoraj.add(Duration(days: 1, hours: 23)))) && (DateTime.now().isAfter(wczoraj.add(Duration(hours: 23))))) {
		iloscDni = await odczytajDni();
		iloscDni++;
		zapiszDni(iloscDni);
		wczoraj = DateTime.now();
		zapiszDate(wczoraj);
	} else usunDni();
}