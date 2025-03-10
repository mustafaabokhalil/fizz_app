class OnboardingModel {
  int? id;
  String? title;
  String? image;
  String? desc;

  OnboardingModel({this.id, this.title, this.image, this.desc});

  OnboardingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    desc = json['desc'];
  }
}
