class Attributes {
  int? id;
  String? key;
  int? keyId;
  String? value;
  bool? required;
  int? ordering;
  String? unit;

  @override
  String toString() {
    return 'Attributes{id: $id, key: $key, keyId: $keyId, value: $value, required: $required, ordering: $ordering, unit: $unit}';
  }

  Attributes(
      {this.id,
        this.key,
        this.keyId,
        this.value,
        this.required,
        this.ordering,
        this.unit});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    keyId = json['key_id'];
    value = json['value'];
    required = json['required'];
    ordering = json['ordering'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['key_id'] = keyId;
    data['value'] = value;
    data['required'] = required;
    data['ordering'] = ordering;
    data['unit'] = unit;
    return data;
  }
}
