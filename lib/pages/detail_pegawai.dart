import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PegawaiDetail extends StatelessWidget {
  final Map pegawai;

  const PegawaiDetail({Key key, @required this.pegawai}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 193, 92, 1),
        title: const Text('Detail Pegawai'),
      ),
      body: 
      Column(
        children: [ 
          const SizedBox(
            height: 10, 
          ),
          Container(
            child: 
            Center(
              child: Image.network(pegawai['profile_image']),
            ),
          ),
          const SizedBox(
            height: 32, 
          ),
        Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          border: TableBorder.all(color: Colors.white),
          children: [
            TableRow(children: [
              Text('Nama', style: TextStyle(fontSize: 17),),
              Text(": " + pegawai['employee_name'], style: TextStyle(fontSize: 17),),
            ]),
            TableRow(children: [
              Text('Umur', style: TextStyle(fontSize: 17),),
              Text(": " + pegawai['employee_age']),
            ]),
            TableRow(children: [
              Text('Gaji', style: TextStyle(fontSize: 17),),
              Text(": " + pegawai['employee_salary'], style: TextStyle(fontSize: 17),),
            ]),
            TableRow(children: [
              Text('TTL', style: TextStyle(fontSize: 17),),
              Text(": " + "data belum ada di API", style: TextStyle(fontSize: 17),),
            ]),
            TableRow(children: [
              Text('Alamat', style: TextStyle(fontSize: 17),),
              Text(": " + "data belum ada di API", style: TextStyle(fontSize: 17),),
            ]),
            TableRow(children: [
              Text('Bagian', style: TextStyle(fontSize: 17),),
              Text(": " + "data belum ada di API", style: TextStyle(fontSize: 17),),
            ]),
            TableRow(children: [
              Text('Lama Bekerja', style: TextStyle(fontSize: 17),),
              Text(": " + "data belum ada di API", style: TextStyle(fontSize: 17),),
            ]),
          ],
        ),
      )          
    ],
    ),
  );

  }
}
