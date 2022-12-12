import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu_listmap/ListSuhu.dart';
import 'package:konversi_suhu_listmap/HistoryKonversi.dart';
import 'package:konversi_suhu_listmap/InputSuhu.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text1 = TextEditingController();
  double kelvin = 0, reamor = 0, input = 0;
  double hasil = 0;

  String selctDropdown = "Kelvin";
  List<String> listSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  List<String> Riwayat = [];

  void onDropChange(Object? value) {
    return setState(() {
      selctDropdown = value.toString();
      if (text1.text.isNotEmpty) {
        switch (selctDropdown) {
          case "Kelvin":
            hasil = double.parse(text1.text) + 273;

            break;

          case "Reamur":
            hasil = double.parse(text1.text) * 4 / 5;
            break;

          case "Fahrenheit":
            hasil = double.parse(text1.text) * 9 / 5 + 32;
            break;
          default:
        }
        Riwayat.add("konversi Dari " +
            text1.text +
            " Celcius Ke " +
            selctDropdown +
            " Dengan Hasil " +
            hasil.toString());
      }
    });
  }

  void Konversi() {
    return setState(() {
      if (text1.text.isNotEmpty) {
        switch (selctDropdown) {
          case "Kelvin":
            hasil = double.parse(text1.text) + 273;

            break;

          case "Reamur":
            hasil = double.parse(text1.text) * 4 / 5;
            break;

          case "Fahrenheit":
            hasil = double.parse(text1.text) * 9 / 5 + 32;
            break;
          default:
        }
        Riwayat.add("konversi Dari " +
            text1.text +
            " Celcius Ke " +
            selctDropdown +
            " Dengan Hasil " +
            hasil.toString());
      }
    });
  }

  double Val = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Konversi Suhu Farah Z.H.2041720069')),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Column(
            children: [
              Slider(
                  value: Val,
                  max: 100,
                  divisions: 10,
                  label: Val.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      Val = value;
                      text1.text = Val.toString();
                    });
                  }),
              ListSuhu(
                selctDropdown: selctDropdown,
                listSuhu: listSuhu,
                onDropChange: onDropChange,
              ),
              Text(
                'Hasil',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                "$hasil",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "History Konversi ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              HistoryKonversi(rw: Riwayat)
            ],
          ),
        ),
      ),
    );
  }
}