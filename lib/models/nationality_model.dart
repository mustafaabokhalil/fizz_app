class NationalityResponse {
  final bool status;
  final String message;
  final List<Nationalities> nationalities;

  NationalityResponse({
    required this.status,
    required this.message,
    required this.nationalities,
  });

  factory NationalityResponse.fromJson(Map<String, dynamic> json) {
    return NationalityResponse(
      status: json['status'],
      message: json['message'],
      nationalities: (json['data'] as List)
          .map((item) => Nationalities.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': nationalities.map((city) => city.toJson()).toList(),
    };
  }
}

class Nationalities {
  final int id;
  final String name;

  Nationalities({
    required this.id,
    required this.name,
  });

  factory Nationalities.fromJson(Map<String, dynamic> json) {
    return Nationalities(
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
