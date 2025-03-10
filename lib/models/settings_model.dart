class SettingsModel {
  String? name;
  String? value;

  SettingsModel({this.name, this.value});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }
}
