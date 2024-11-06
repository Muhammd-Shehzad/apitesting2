class ZaheenApp {
  int? id;
  String? name;
  int? boardId;
  String? thumbnail;
  Status? status;
  int? courseTypeId;
  String? thumbnailUrl;

  ZaheenApp(
      {this.id,
      this.name,
      this.boardId,
      this.thumbnail,
      this.status,
      this.courseTypeId,
      this.thumbnailUrl});

  ZaheenApp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    boardId = json['board_id'];
    thumbnail = json['thumbnail'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    courseTypeId = json['course_type_id'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['board_id'] = this.boardId;
    data['thumbnail'] = this.thumbnail;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['course_type_id'] = this.courseTypeId;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

class Status {
  String? type;
  List<int>? data;

  Status({this.type, this.data});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['data'] = this.data;
    return data;
  }
}
