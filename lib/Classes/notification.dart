class NotificationA{
  String title,reciverid,creatorId,detail,timeStamp,id,img;

  NotificationA(
      {this.title, this.reciverid,this.creatorId, this.detail, this.timeStamp, this.id,this.img});

  factory NotificationA.fromMap(Map map) {
    return new NotificationA(
      title: map['title'] as String,
      reciverid: map['reciverid'] as String,
      creatorId: map['creatorId'] as String,
      detail: map['detail'] as String,
      timeStamp: map['timeStamp'].toString(),
      id: map['id'] as String,
      img: map['img'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'reciverid': this.reciverid,
      'creatorId': this.creatorId,
      'detail': this.detail,
      'timeStamp': this.timeStamp,
      'id': this.id,
      'img': this.img,
    } as Map<String, dynamic>;
  }
}