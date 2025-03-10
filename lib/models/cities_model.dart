class CityResponse {
  final bool status;
  final String message;
  final List<City> cities;

  CityResponse({
    required this.status,
    required this.message,
    required this.cities,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) {
    return CityResponse(
      status: json['status'],
      message: json['message'],
      cities:
          (json['data'] as List).map((item) => City.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': cities.map((city) => city.toJson()).toList(),
    };
  }
}

class City {
  final int id;
  final String name;

  City({
    required this.id,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
