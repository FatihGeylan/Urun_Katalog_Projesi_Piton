class CategoryListModel {
  List<Category>? categories;

  CategoryListModel({this.categories});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      categories = <Category>[];
      json['category'].forEach((v) {
        categories!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['category'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? createdAt;

  Category({this.id, this.name, this.createdAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    return data;
  }
}