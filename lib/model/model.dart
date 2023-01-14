// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo? userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo? data) => json.encode(data!.toJson());

class UserInfo {
  UserInfo({
    this.results,
    this.info,
  });

  List<Result?>? results;
  Info? info;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        results: json["results"] == null
            ? []
            : List<Result?>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x!.toJson())),
        "info": info!.toJson(),
      };
}

class Info {
  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  String? seed;
  int? results;
  int? page;
  String? version;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}

class Result {
  Result({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  Gender? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Dob? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: genderValues.map[json["gender"]],
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        login: Login.fromJson(json["login"]),
        dob: Dob.fromJson(json["dob"]),
        registered: Dob.fromJson(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: Id.fromJson(json["id"]),
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": genderValues.reverse![gender],
        "name": name!.toJson(),
        "location": location!.toJson(),
        "email": email,
        "login": login!.toJson(),
        "dob": dob!.toJson(),
        "registered": registered!.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id!.toJson(),
        "picture": picture!.toJson(),
        "nat": nat,
      };
}

class Dob {
  Dob({
    this.date,
    this.age,
  });

  DateTime? date;
  int? age;

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "age": age,
      };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

class Id {
  Id({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  Street? street;
  String? city;
  String? state;
  String? country;
  dynamic postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street!.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates!.toJson(),
        "timezone": timezone!.toJson(),
      };
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  String? latitude;
  String? longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Street {
  Street({
    this.number,
    this.name,
  });

  int? number;
  String? name;

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
      };
}

class Timezone {
  Timezone({
    this.offset,
    this.description,
  });

  String? offset;
  String? description;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
      };
}

class Login {
  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
      };
}

class Name {
  Name({
    this.title,
    this.first,
    this.last,
  });

  Title? title;
  String? first;
  String? last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: titleValues.map[json["title"]],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": titleValues.reverse![title],
        "first": first,
        "last": last,
      };
}

enum Title { MRS, MR, MS }

final titleValues =
    EnumValues({"Mr": Title.MR, "Mrs": Title.MRS, "Ms": Title.MS});

class Picture {
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  String? large;
  String? medium;
  String? thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
