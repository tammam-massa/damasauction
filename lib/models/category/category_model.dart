// category_model.dart
class CategoryModel {
  final int categoryId;
  final String name;
  final String description;
  final String? photo; // Optional field for the photo URL
  final List<Attribute> attributes;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.description,
    this.photo, // Allowing null for optional photo field
    required this.attributes,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String?, // Cast to String? for optional field
      attributes: (json['attributes'] as List<dynamic>)
          .map((attribute) =>
              Attribute.fromJson(attribute as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Attribute {
  final int attributeId;
  final String attributeName;
  final List<Option> attributeTypeList;

  Attribute({
    required this.attributeId,
    required this.attributeName,
    required this.attributeTypeList,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      attributeId: json['attribute_id'] as int,
      attributeName: json['attribute_name'] as String,
      attributeTypeList: (json['attribute_type_list'] as List<dynamic>)
          .map((option) => Option.fromJson(option as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Option {
  final int typeListId;
  final int attributeId;
  final String option;

  Option({
    required this.typeListId,
    required this.attributeId,
    required this.option,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      typeListId: json['type_list_id'] as int,
      attributeId: json['attribute_id'] as int,
      option: json['option'] as String,
    );
  }
}
