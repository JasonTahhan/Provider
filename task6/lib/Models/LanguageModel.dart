class LanguageModel {
  String idLanguage;
  String languageCode;
  String languageDescription;

  LanguageModel({
    required this.idLanguage,
    required this.languageCode,
    required this.languageDescription,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      idLanguage: json['idLanguage'],
      languageCode: json['languageCode'],
      languageDescription: json['languageDescription'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idLanguage'] = this.idLanguage;
    data['languageCode'] = this.languageCode;
    data['languageDescription'] = this.languageDescription;
    return data;
  }

  @override
  String toString() {
    return 'LanguageModel(idLanguage: $idLanguage, languageCode: $languageCode, languageDescription: $languageDescription)';
  }
}
