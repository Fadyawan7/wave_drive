// import 'package:wave_drive/core/data/local/database/database.dart';
// import 'package:objectbox/objectbox.dart';

// class BaseDatabaseRepository<T> {
//   final Box<T> _box = database.store.box<T>();

//   Box<T> get box => _box;

//   // Create or Update (Upsert)
//   int save(T entity) {
//     return _box.put(entity);
//   }

//   // Retrieve by ID
//   T? getById(int id) {
//     return _box.get(id);
//   }

//   // Retrieve all
//   List<T> getAll() {
//     return _box.getAll();
//   }

//   // Delete by ID
//   bool delete(int id) {
//     return _box.remove(id);
//   }

//   // Delete all
//   void deleteAll() {
//     _box.removeAll();
//   }
// }
