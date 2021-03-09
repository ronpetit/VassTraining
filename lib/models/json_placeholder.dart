
class JsonPlaceholder {
  final int userID;
  final int id;
  final String title;
  final bool completed;

  JsonPlaceholder({required this.userID, required this.id, required this.title, required this.completed});

  static JsonPlaceholder fromJson(Map<String, dynamic> json) {
    return JsonPlaceholder(userID: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);
  }
}
