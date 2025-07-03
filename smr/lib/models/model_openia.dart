import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getChatGPTResponse(String userMessage) async {
  final url = Uri.https('api.openai.com', '/v1/chat/completions');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer TU_API_KEY',
    },
    body: jsonEncode({
      'model': 'gpt-4o',
      'messages': [
        {'role': 'user', 'content': userMessage},
      ],
      'temperature': 0.7,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final content = data['choices'][0]['message']['content'];
    return content;
  } else {
    throw Exception('Error: ${response.statusCode} ${response.body}');
  }
}
