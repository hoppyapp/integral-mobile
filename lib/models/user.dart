import 'package:integral_nutry/shared/arquitecture.dart' show Model;

/// User model
class User implements Model {

  /// Attribute
  String _name;
  String _email;
  String _platform;
  DateTime _birthDate;
  List<Measure> _measures;

  /// Methods getters
  String get name => this._name;
  String get email => this._email;
  String get platform => this._platform;
  DateTime get birthDate => this._birthDate;
  List<Measure> get measures => this._measures;

  /// Constructor
  User(this._name, this._email, this._platform, this._birthDate, this._measures);

  /// Constructor to Json
  User.fromJson(Map<String, dynamic> userJson) {

    print("TEST: $userJson");

    try {

      this._name = userJson["name"] as String;
      this._email = userJson["email"] as String;
      this._platform = userJson["platform"] as String;
      this._birthDate = userJson["birthDate"] as DateTime;
      this._measures = (userJson["measures"] as List<dynamic>).map((dynamic measure) {
        measure = Map<String, dynamic>.from(measure);
        return Measure(measure["weight"], measure["height"], measure["date"]);
      }).toList();

    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  /// Convert to text [String]
  String toString() => "{ name: $name, email: $email, platform: $platform, birthDate: $birthDate, measures: $measures }";

  @override
  /// Convert to JSON [Map<String, dynamic>]
  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "birthDate": birthDate,
    "platform": platform,
    "measures": measures.map((Measure measure) => measure.toJson()).toList()
  };

}

/// Measure model
class Measure implements Model {

  /// Attribute
  double _weight;
  double _height;
  DateTime _date;

  /// Methods getters
  double get weight => this._weight;
  double get height => this._height;
  DateTime get date => this._date;

  /// Constructor
  Measure(this._weight, this._height, this._date);

  @override
  /// Convert to text [String]
  String toString() => "{ weight: ${this.weight}, height: ${this.height}, date: ${this.date} }";

  @override
  /// Convert to Json [Map<String, dynamic>]
  Map<String, dynamic> toJson() => {
    "weight": this.weight,
    "height": this.height,
    "date": this.date
  };

}