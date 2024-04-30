// To parse this JSON data, do
//
//     final myUserInfo = myUserInfoFromJson(jsonString);

import 'dart:convert';

MyUserInfo myUserInfoFromJson(String str) => MyUserInfo.fromJson(json.decode(str));

String myUserInfoToJson(MyUserInfo data) => json.encode(data.toJson());

class MyUserInfo {
    UserInfo userInfo;
    List<Subscription> subscriptions;

    MyUserInfo({
        required this.userInfo,
        required this.subscriptions,
    });

    factory MyUserInfo.fromJson(Map<String, dynamic> json) => MyUserInfo(
        userInfo: UserInfo.fromJson(json["userInfo"]),
        subscriptions: List<Subscription>.from(json["subscriptions"].map((x) => Subscription.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userInfo": userInfo.toJson(),
        "subscriptions": List<dynamic>.from(subscriptions.map((x) => x.toJson())),
    };
}

class Subscription {
    String title;
    String subtitle;
    String content;
    String subscriptionId;
    int likes;

    Subscription({
        required this.title,
        required this.subtitle,
        required this.content,
        required this.subscriptionId,
        required this.likes,
    });

    factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        title: json["title"],
        subtitle: json["subtitle"],
        content: json["content"],
        subscriptionId: json["subscriptionId"],
        likes: json["likes"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "content": content,
        "subscriptionId": subscriptionId,
        "likes": likes,
    };
}

class UserInfo {
    String name;
    int age;
    String address;
    String account;

    UserInfo({
        required this.name,
        required this.age,
        required this.address,
        required this.account,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        name: json["name"],
        age: json["age"],
        address: json["address"],
        account: json["account"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "address": address,
        "account": account,
    };
}
