import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  Pagination({
    required this.count,
    required this.total,
    required this.page,
    required this.pageCount,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  int page;
  int pageCount;
  int count;
  int total;

  @override
  bool operator ==(covariant Pagination other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.total == total &&
        other.page == page &&
        other.pageCount == pageCount;
  }

  @override
  int get hashCode {
    return count.hashCode ^ total.hashCode ^ page.hashCode ^ pageCount.hashCode;
  }

  @override
  String toString() {
    return 'Pagination(totalCount: $count, totalPages: $total, currentPage: $page, limit: $pageCount)';
  }

  bool get canLoadMore => page < pageCount;

  Pagination copyWith({
    int? count,
    int? total,
    int? page,
    int? pageCount,
  }) {
    return Pagination(
      count: count ?? this.count,
      total: total ?? this.total,
      page: page ?? this.page,
      pageCount: pageCount ?? this.pageCount,
    );
  }

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}