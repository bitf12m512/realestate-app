
class Transaction{
  // Subscription subscription;
  String nodeId,timeStamp,paymentId,Id,userId,propertyId;

  Transaction(
      {
        // this.subscription,
        this.propertyId,
      this.nodeId,
      this.timeStamp,
      this.paymentId,
      this.Id,
      this.userId});

  factory Transaction.fromMap(Map map) {
    return new Transaction(
      // subscription: Subscription.fromMap(map['subscription']) ,
      nodeId: map['nodeId'] as String,
      propertyId: map['propertyId'] as String,
      timeStamp: map['timeStamp'] as String,
      paymentId: map['paymentId'] as String,
      Id: map['Id'] as String,
      userId: map['userId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      // 'subscription': this.subscription.toMap(),
      'nodeId': this.nodeId,
      'timeStamp': this.timeStamp,
      'paymentId': this.paymentId,
      'Id': this.Id,
      'propertyId': this.propertyId,
      'userId': this.userId,
    } as Map<String, dynamic>;
  }
}