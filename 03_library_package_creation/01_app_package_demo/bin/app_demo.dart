import 'package:http/http.dart' as http;


void main() {
	print("Application package demo");
	var url = "https://api.github.com";
	http.post(url, body: {"name": "doodle", "color": "blue"})
    .then((response) {
  		print("Response status: ${response.statusCode}");
  		print("Response body: ${response.body}");
	});

	http.read("https://api.github.com").then(print);
}
