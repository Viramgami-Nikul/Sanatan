class UserAddressModel {
  final String addressLine1;

  final String? addressLine2;

  final String city;

  final String state;

  final String country;

  final String zipCode;

  final double? latitude;

  final double? longitude;

  UserAddressModel({
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    this.latitude,
    this.longitude,
  });

  factory UserAddressModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return UserAddressModel(
      addressLine1:
      json['address_line_1'] ?? '',

      addressLine2:
      json['address_line_2'],

      city:
      json['city'] ?? '',

      state:
      json['state'] ?? '',

      country:
      json['country'] ?? '',

      zipCode:
      json['zip_code'] ?? '',

      latitude:
      json['latitude'] != null
          ? double.tryParse(
        json['latitude'].toString(),
      )
          : null,

      longitude:
      json['longitude'] != null
          ? double.tryParse(
        json['longitude'].toString(),
      )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_line_1': addressLine1,
      'address_line_2': addressLine2,
      'city': city,
      'state': state,
      'country': country,
      'zip_code': zipCode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  UserAddressModel copyWith({
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? country,
    String? zipCode,
    double? latitude,
    double? longitude,
  }) {
    return UserAddressModel(
      addressLine1:
      addressLine1 ?? this.addressLine1,

      addressLine2:
      addressLine2 ?? this.addressLine2,

      city:
      city ?? this.city,

      state:
      state ?? this.state,

      country:
      country ?? this.country,

      zipCode:
      zipCode ?? this.zipCode,

      latitude:
      latitude ?? this.latitude,

      longitude:
      longitude ?? this.longitude,
    );
  }
}
