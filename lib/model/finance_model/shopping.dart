import 'package:equatable/equatable.dart';

class ShoppingModel extends Equatable {
  final int id;
  final String name;
  final double money;
  final String time;
  final String type;
  final String kind;
  final String paymentType;
  final String note;
  final ImageInfo image;
  final User user;

  ShoppingModel({
    required this.id,
    required this.name,
    required this.money,
    required this.time,
    required this.type,
    required this.kind,
    required this.paymentType,
    required this.note,
    required this.image,
    required this.user,
  });

  factory ShoppingModel.fromJson(Map<String, dynamic> json) {
    return ShoppingModel(
      id: json['id'],
      name: json['name'],
      money: json['money'].toDouble(),
      time: json['time'],
      type: json['type'],
      kind: json['kind'],
      paymentType: json['payment_type'],
      note: json['note'],
      image: ImageInfo.fromJson(json['image']),
      user: User.fromJson(json['user']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        money,
        time,
        type,
        kind,
        paymentType,
        note,
        image,
        user,
      ];
}

class ImageInfo {
  final String imageBill;
  final String imageItems;

  ImageInfo({required this.imageBill, required this.imageItems});

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      imageBill: json['image_bill'],
      imageItems: json['image_items'],
    );
  }
}

class User {
  final String nickname;
  final int userId;

  User({required this.nickname, required this.userId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nickname: json['nickname'],
      userId: json['user_id'],
    );
  }
}
