import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    var url = Uri.parse(this.url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body;

      return jsonDecode(data);
    } else {
      stderr.writeln(response.statusCode);
    }
  }

}

