import 'dart:io';
import 'package:http/http.dart' as http;

extension Validation on http.Response {
  bool get isSuccessful =>
      statusCode >= HttpStatus.ok;
}