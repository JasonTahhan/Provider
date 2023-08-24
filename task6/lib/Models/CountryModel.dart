class CountryModel {
  final String? countryId;
  final String? countryName;
  final String? countryCode;
  final String? isoCode2;
  final String? isoCode3;

  CountryModel({
    this.countryId,
    this.countryName,
    this.countryCode,
    this.isoCode2,
    this.isoCode3,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        countryId: json["idCountry"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        isoCode2: json["isoCode2"],
        isoCode3: json["isoCode3"],
      );

  Map<String, dynamic> toJson() => {
        "idCountry": countryId,
        "countryName": countryName,
        "countryCode": countryCode,
        "isoCode2": isoCode2,
        "isoCode3": isoCode3,
      };

  @override
  String toString() {
    return 'CountryModel(idCountry: $countryId, countryName: $countryName, countryCode: $countryCode, isoCode2: $isoCode2, isoCode3: $isoCode3)';
  }
}

