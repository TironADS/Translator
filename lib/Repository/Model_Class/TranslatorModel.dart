class TranslatorModel {
  TranslatorModel({
      this.trans, 
      this.sourceLanguageCode, 
      this.sourceLanguage, 
      this.trustLevel,});

  TranslatorModel.fromJson(dynamic json) {
    trans = json['trans'];
    sourceLanguageCode = json['source_language_code'];
    sourceLanguage = json['source_language'];
    trustLevel = json['trust_level'];
  }
  String? trans;
  String? sourceLanguageCode;
  String? sourceLanguage;
  int? trustLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trans'] = trans;
    map['source_language_code'] = sourceLanguageCode;
    map['source_language'] = sourceLanguage;
    map['trust_level'] = trustLevel;
    return map;
  }

}