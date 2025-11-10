// // ignore: depend_on_referenced_packages
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';

// late LocalDatabase database;

// class LocalDatabase {
//   late final Store store;

//   LocalDatabase._create(this.store);

//   static Future<LocalDatabase> create() async {
//     final docsDir = await getApplicationDocumentsDirectory();
//     final store =await openStore(
//       directory: p.join(docsDir.path, "obx-example"),
//     );
//     return LocalDatabase._create(store);
//   }
// }
