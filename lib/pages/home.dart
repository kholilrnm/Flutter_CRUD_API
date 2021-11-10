import 'package:crud_employee_v1/pages/add_pegawai.dart';
import 'package:crud_employee_v1/pages/edit_pegawai.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:crud_employee_v1/pages/detail_pegawai.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url =
      'https://crud-employee.000webhostapp.com/api/C_ApiEmployee/show';

  Future getDataUrl() async {
    var response = await http.get(Uri.parse(url));
    // print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  Future getDelPegawaiID(String pegawaiId) async {
    String urlDel =
        'https://crud-employee.000webhostapp.com/api/C_ApiEmployee/destroy/' +
            pegawaiId;
    print(urlDel);
    var responseDel = await http.get(Uri.parse(urlDel));
    return jsonDecode(responseDel.body);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPegawai()));
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(1, 193, 92, 1),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(52.0),
          child: AppBar(
            title: const Text('Data Pegawai'),
            backgroundColor:
                const Color.fromRGBO(1, 193, 92, 1), // (x, x, x, opacity)
          ),
        ),
        body: FutureBuilder(
            future: getDataUrl(),
            builder: (context, getDataJson) {
              if (getDataJson.hasData) {
                return ListView.builder(
                    itemCount: getDataJson.data['data'].length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 130,
                        child: Card(
                          elevation: 8,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PegawaiDetail(
                                              pegawai: getDataJson.data['data']
                                                  [index])));
                                },
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    padding: const EdgeInsets.all(5),
                                    child: Image.network(
                                      getDataJson.data['data'][index]
                                          ['profile_image'],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                              getDataJson.data['data'][index]
                                                  ['employee_name'],
                                              style: const TextStyle(
                                                  fontSize: 21,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                              "Age: " +
                                                  getDataJson.data['data']
                                                      [index]['employee_age'],
                                              style: const TextStyle(
                                                  fontSize: 18))),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 15, 0, 0),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => EditPegawai(
                                                                pegawaiDataEdit:
                                                                    getDataJson.data[
                                                                            'data']
                                                                        [
                                                                        index])));
                                                  },
                                                  child:
                                                      const Icon(Icons.edit))),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 15, 40, 0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  getDelPegawaiID(getDataJson
                                                          .data['data'][index]
                                                              ['id']
                                                          .toString())
                                                      .then((value) {
                                                    setState(() {
                                                      
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Data Pegawai Telah Dihapus !")));
                                                  });
                                                },
                                                child: const Icon(Icons.delete),
                                              )),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 15, 0, 0),
                                            child: Text(
                                                'Salary: \$' +
                                                    getDataJson.data['data']
                                                            [index]
                                                        ['employee_salary'],
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      // return Text(getDataJson.data['data'][index]['employee_name']);
                    });
              } else {
                return const Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    height: 25,
                    width: 25,
                  ),
                );
              }
            }));
  }
}
