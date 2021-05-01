part of 'models.dart';

class Notifikasi extends Equatable {
  final String id, title, body, image, category, idUser, token;
  final DateTime timecreate;
  final bool isRead;
  Notifikasi(
      {this.id,
      @required this.idUser,
      @required this.title,
      @required this.body,
      @required this.category,
      @required this.token,
      this.image,
      @required this.timecreate,
      this.isRead});

  @override
  List<Object> get props => [
        id,
        idUser,
        token,
        title,
        body,
        image,
        timecreate,
        category,
        isRead,
      ];

  Notifikasi copyWith(bool isRead) {
    return Notifikasi(
        id: this.id,
        idUser: this.idUser,
        title: this.title,
        body: this.body,
        category: this.category,
        token: this.token,
        timecreate: this.timecreate,
        isRead: isRead ?? this.isRead);
  }
}
