class Carrier {
  int? code;
  String? title;
  Codes? codes;
  String? address;
  String? url;
  String? email;
  String? contacts;
  String? phone;
  String? logo;
  String? logoSvg;

  Carrier(
      {this.code,
      this.title,
      this.codes,
      this.address,
      this.url,
      this.email,
      this.contacts,
      this.phone,
      this.logo,
      this.logoSvg});

  factory Carrier.fromJson(Map<String, dynamic> json) {
    return Carrier(
        code: json['code'],
        title: json['title'],
        codes: json['codes'] != null ? Codes.fromJson(json['codes']) : null,
        address: json['address'],
        url: json['url'],
        email: json['email'],
        contacts: json['contacts'],
        phone: json['phone'],
        logo: json['logo'],
        logoSvg: json['logo_svg']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class Codes {
  String? iata;
  String? icao;

  Codes({this.iata, this.icao});

  factory Codes.fromJson(Map<String, dynamic> json) {
    return Codes(iata: json['iata'], icao: json['icao']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
