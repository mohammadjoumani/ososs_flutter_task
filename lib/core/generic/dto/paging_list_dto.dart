class PagingListDto<T> {
  int? count;
  String? next;
  String? previous;
  T? results;

  PagingListDto({this.count, this.next, this.previous, this.results});

  PagingListDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    data['results'] = this.results;
    return data;
  }
}
