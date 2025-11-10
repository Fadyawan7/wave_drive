// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:json_annotation/json_annotation.dart';
// import 'package:objectbox/objectbox.dart';
// part 'user_entity.g.dart';

// @Entity()
// @JsonSerializable()
// class UserEntity {
//   UserEntity({
//     this.id = 0,
//     required this.code,
//     this.level = 0,
//     this.name,
//     this.syncDate,
//     this.picture,
//   });

//   @Id()
//   int id;

//   String code;
//   String? name;
//   String? picture;
//   String? avatarFrame;
//   int level;

//   @Property(type: PropertyType.date) // Store as int in milliseconds
//   DateTime? syncDate;

//   @override
//   String toString() {
//     return "id:$id code:$code name:$name level:$level";
//   }

//   factory UserEntity.fromJson(Map<String, dynamic> json) =>
//       _$UserEntityFromJson(json);
//   Map<String, dynamic> toJson() => _$UserEntityToJson(this);
// }
