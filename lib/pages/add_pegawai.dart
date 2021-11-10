import 'dart:convert';
import 'package:crud_employee_v1/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class AddPegawai extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _umurController = TextEditingController();
  TextEditingController _gajiController = TextEditingController();
  TextEditingController _profileImageController = TextEditingController();

  Future SavePegawai() async {
    final response = await http.post(
        Uri.parse(
            "https://crud-employee.000webhostapp.com/api/C_ApiEmployee/store"),
        body: {
          "employee_name": _nameController.text,
          "employee_age": _umurController.text,
          "employee_salary": _gajiController.text,
          "profile_image": _profileImageController.text,
        });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 193, 92, 1),
        title: Text('Tambah Pegawai'),
      ),
      body: Container(
        margin: const EdgeInsets.all(3),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: "Nama"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Nama Pegawai";
                        }
                        return null;
                      }),
                  TextFormField(
                      controller: _umurController,
                      decoration: InputDecoration(labelText: "Umur"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Umur";
                        }
                        // return null;
                      }),
                  TextFormField(
                      controller: _gajiController,
                      decoration: InputDecoration(labelText: "Gaji"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Gaji";
                        }
                        return null;
                      }),
                  TextFormField(
                      controller: _profileImageController,
                      decoration: InputDecoration(labelText: "Profile Image"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Foto Profile";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          SavePegawai().then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Pegawai Berhasil Diubah !")));
                          });
                        } else {
                          return Text('aaaaaaa');
                        }
                      },
                      child: Text("Simpan")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
