
import 'dart:convert';

abstract class Model {
  Map<String, dynamic> data();
  Iterable<String> get keys => data().keys;
  Iterable<dynamic> get values => data().values;
  @override
  String toString() {
    return jsonEncode(data());
  }
}