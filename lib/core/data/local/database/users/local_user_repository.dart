// import 'package:wave_drive/core/data/local/database/base_database_repository.dart';
// import 'package:wave_drive/core/data/local/database/users/user_entity.dart';
// import 'package:wave_drive/core/shared/utils/app_logger.dart';
// import 'package:wave_drive/objectbox.g.dart';

// class LocalUserRepository extends BaseDatabaseRepository<UserEntity> {
//   Future<void> put(UserEntity user) async {
//     try {
//       user.syncDate = DateTime.now();
//       await box.putAsync(user, mode: PutMode.insert);
//       AppLogger.d("Put user to database: $user");
//     } catch (error, stack) {
//       AppLogger.e(
//         "Put user to database failed: $user",
//         error: error,
//         stackTrace: stack,
//       );
//     }
//   }

//   Future<void> putIfAbsent(UserEntity user) async {
//     final query = box.query(UserEntity_.code.equals(user.code)).build();
//     final savedUser = await query.findUniqueAsync();

//     if (savedUser != null) {
//       savedUser.syncDate = DateTime.now();

//       /// Re-update user info level if level was updated
//       if (savedUser.level != user.level) {
//         savedUser.level = user.level;
//       }

//       await update(savedUser);
//       return;
//     }

//     await put(user);
//   }

//   Future<void> update(UserEntity user) async {
//     try {
//       user.syncDate = DateTime.now();
//       await box.putAsync(user, mode: PutMode.put);
//       AppLogger.d("Update user: $user");
//     } catch (error, stack) {
//       AppLogger.e("Update user failed: $user", error: error, stackTrace: stack);
//     }
//   }

//   Future<void> updateUserLevel(String code, int level) async {
//     final query = box.query(UserEntity_.code.equals(code)).build();
//     final user = await query.findUniqueAsync();
//     if (user == null || level == 0) return;
//     user.level = level;
//     await update(user);
//   }

//   Future<UserEntity?> queryByCode(String code) async {
//     try {
//       final query = box.query(UserEntity_.code.equals(code)).build();
//       return await query.findUniqueAsync();
//     } catch (error, stack) {
//       AppLogger.e("Query user failed: $code", error: error, stackTrace: stack);
//       return null;
//     }
//   }

//   Future<List<UserEntity>> queryByCodes(List<String> code) async {
//     try {
//       final query = box.query(UserEntity_.code.oneOf(code)).build();
//       return await query.findAsync();
//     } catch (error, stack) {
//       AppLogger.e(
//         "Update users failed: $code",
//         error: error,
//         stackTrace: stack,
//       );
//       return [];
//     }
//   }

//   Future<bool?> removeById(int id) async {
//     try {
//       return box.removeAsync(id);
//     } catch (error, stack) {
//       AppLogger.e("Remove by id failed $id", error: error, stackTrace: stack);
//       return null;
//     }
//   }

//   bool needResync(UserEntity user) {
//     if (user.syncDate == null) return true;
//     return DateTime.now().difference(user.syncDate!).inHours > 1;
//   }
// }
