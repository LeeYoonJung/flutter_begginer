// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_momong_project/beginner/1_dust/models/airResult.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_momong_project/main.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() {
  test('http 통신 테스트', () async {
    var url = 'http://api.airvisual.com/v2/nearest_city?key=c35a128f-9dd6-4fc8-a6c3-840ee6946446';
    var response = await http.get(Uri.parse(url));

    expect(response.statusCode, 200);

    AirResult result = AirResult.fromJson(json.decode(response.body));
    expect(result.status, 'success');
  });
}
