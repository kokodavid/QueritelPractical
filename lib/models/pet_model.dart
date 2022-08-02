class PetModel {
  List<Pet>? pet;

  PetModel({this.pet});

  PetModel.fromJson(Map<String, dynamic> json) {
    if (json['pet'] != null) {
      pet = <Pet>[];
      json['pet'].forEach((v) {
        pet!.add(new Pet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pet != null) {
      data['pet'] = this.pet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pet {
  String? name;
  String? photo;
  int? age;
  int? weight;
  String? description;

  Pet({this.name, this.photo, this.age, this.weight, this.description});

  Pet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    age = json['age'];
    weight = json['weight'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['description'] = this.description;
    return data;
  }
}
