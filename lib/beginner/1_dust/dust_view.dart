import 'package:flutter/material.dart';
import 'package:flutter_momong_project/beginner/1_dust/models/airResult.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DustView extends StatefulWidget {
  const DustView({Key? key}) : super(key: key);

  @override
  State<DustView> createState() => _DustViewState();
}

class _DustViewState extends State<DustView> {
  AirResult? _result;

  Future<AirResult> fetchData() async {
    var url =
        'http://api.airvisual.com/v2/nearest_city?key=c35a128f-9dd6-4fc8-a6c3-840ee6946446';
    var response = await http.get(Uri.parse(url));

    AirResult result = AirResult.fromJson(json.decode(response.body));

    return result;
  }

  @override
  void initState() {
    super.initState();

    fetchData().then((airResult) {
      setState(() {
        _result = airResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _result == null
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '현재 위치 미세먼지',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: getColor(_result!),
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text('얼굴사진'),
                                Text(
                                  '${_result!.data!.current!.pollution!.aqius}',
                                  style: const TextStyle(fontSize: 40),
                                ),
                                Text(
                                  getString(_result!),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://airvisual.com/images/${_result!.data!.current!.weather!.ic}.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      '${_result!.data!.current!.weather!.tp}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Text(
                                    '습도 ${_result!.data!.current!.weather!.hu}'),
                                Text(
                                    '풍속 ${_result!.data!.current!.weather!.ws}m/s'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 50),
                          backgroundColor: Colors.orange,
                        ),
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Color getColor(AirResult result) {
    if (result.data!.current!.pollution!.aqius! <= 50) {
      return Colors.greenAccent;
    } else if (result.data!.current!.pollution!.aqius! <= 100) {
      return Colors.yellow;
    } else if (result.data!.current!.pollution!.aqius! <= 150) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getString(AirResult result) {
    if (result.data!.current!.pollution!.aqius! <= 50) {
      return '좋음';
    } else if (result.data!.current!.pollution!.aqius! <= 100) {
      return '보통';
    } else if (result.data!.current!.pollution!.aqius! <= 150) {
      return '나쁨';
    } else {
      return '매우 나쁨';
    }
  }
}
