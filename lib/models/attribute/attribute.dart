class Attribute {
  final int attributeId;
  final String attributeName;
  final List<AttributeOption> options;

  Attribute({
    required this.attributeId,
    required this.attributeName,
    required this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    var optionsJson = json['attribute_type_list'] as List;
    List<AttributeOption> optionsList =
        optionsJson.map((i) => AttributeOption.fromJson(i)).toList();

    return Attribute(
      attributeId: json['attribute_id'],
      attributeName: json['attribute_name'],
      options: optionsList,
    );
  }
}

class AttributeOption {
  final int typeListId;
  final String option;

  AttributeOption({
    required this.typeListId,
    required this.option,
  });

  factory AttributeOption.fromJson(Map<String, dynamic> json) {
    return AttributeOption(
      typeListId: json['type_list_id'],
      option: json['option'],
    );
  }
}
