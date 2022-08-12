import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:server_manager/model/model.dart';

class ServersPage extends StatefulWidget {
  const ServersPage({Key? key}) : super(key: key);

  @override
  _ServersPageState createState() => _ServersPageState();
}

class _ServersPageState extends State<ServersPage> {
  List<Tunnel> listModel = [];
  List<Tunnel> dataList = [];
  var loading = false;

  Future getData() async {
    setState(() {
      loading = true;
    });
    final responseData = await http.get(
      // Uri.parse('https://62f6284e612c13062b47b483.mockapi.io/tunnels'),
      Uri.parse('https://api.ngrok.com/tunnels'),
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer 2DFAs4a94pBhHYEeIJg5g0xG6ao_4afsyHGvaubb7NpxBLHb7',
        HttpHeaders.contentTypeHeader: 'application/json',
        "Ngrok-Version": "2",
      },
    );
    print(responseData.body.toString());
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      final tunnels = data['tunnels'];
      dataList = []; // clear list
      for (Map<String, dynamic> i in tunnels) {
        dataList.add(Tunnel.fromJson(i));
      }
      setState(() {
        listModel = dataList;
        loading = false;
      });
      // print(dataList);
    }
  }

  // Call Data
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server'),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text('refresh')),
        ],
      ),
      body: Container(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: listModel.length,
                itemBuilder: (context, i) {
                  final tunnel = listModel[i];
                  return ListTile(
                    visualDensity: VisualDensity.compact,
                    title: Text(
                      tunnel.id.toString(),
                    ),
                    subtitle: Text(tunnel.public_url),
                  );
                }),
      ),
    );
  }
}
