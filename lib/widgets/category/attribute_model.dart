// attribute_model.dart
class Attribute {
  final String attributeName;
  final List<Option> attributeTypeList;

  Attribute({required this.attributeName, required this.attributeTypeList});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    var list = json['attribute_type_list'] as List;
    List<Option> options = list.map((i) => Option.fromJson(i)).toList();
    return Attribute(
      attributeName: json['attribute_name'],
      attributeTypeList: options,
    );
  }
}

class Option {
  final String option;

  Option({required this.option});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      option: json['option'],
    );
  }
}
