import 'dart:convert';

import 'package:fe_bookly/models/api_response.dart';
import 'package:fe_bookly/services/user_services.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

Future<ApiResponse> tambahBagian(
    String judulBagian, String isi, int bukuId) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getToken();
    final response = await http.post(
      Uri.parse('$bukuURL/$bukuId$bagianURL'), // Periksa URL ini
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'judul_bagian': judulBagian,
        'isi': isi,
        'buku_id': bukuId, // Tambahkan buku_id di body
      }),
    );

    // Handle the response
    switch (response.statusCode) {
      case 200:
      case 201:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}
