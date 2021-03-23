
class QuestionModel {
  String title;
  String content;
  String hexColor;

  QuestionModel({this.title, this.content, this.hexColor});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    hexColor = json['card_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['card_color'] = this.hexColor;
    return data;
  }
}