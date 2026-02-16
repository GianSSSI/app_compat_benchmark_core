class DefaultValue {
  final String key;
  final dynamic value;

  const DefaultValue({required this.key, required this.value});

  ///db driven
  factory DefaultValue.fromJson(Map<String, dynamic> json) {
    return DefaultValue(
      key: json['key'] as String,
      value: (json['value'] as num).toDouble(),
    );
  }

  ///db driven
  Map<String, dynamic> toJson() {
    return {'key': key, 'value': value};
  }
}
