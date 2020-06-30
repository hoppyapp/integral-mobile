import 'package:integral_nutry/databases/hive.dart';
import 'package:integral_nutry/models/user.dart';

/// User repository
class UserRepository {

  HiveDatabase db = HiveDatabase();

  Future<void> storage(User user) async {

    print(user);

    await db.setData<User>("name", user.name);

    await db.setData<User>("email", user.email);

    await db.setData<User>("platform", user.platform);

    await db.setData<User>("birthDate", user.birthDate);

    await db.setData<User>("measures", user.measures.map((Measure measure) => measure.toJson()).toList());

    await db.setData<User>("logged", true);

  }

  Future<User> get user async {

    try {

      User user = User.fromJson({
        "name": await db.getData<User>("name"),
        "email": await db.getData<User>("email"),
        "platform": await db.getData<User>("platform"),
        "birthDate": await db.getData<User>("birthDate"),
        "measures": await db.getData<User>("measures"),
      });

     return user;
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<bool> logged() async {
    
    return (await db.getData<User>("logged") == true);
  }

}