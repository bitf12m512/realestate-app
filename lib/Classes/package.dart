class Package{
  String id,days,price;

  Package({this.id, this.days, this.price});

  factory Package.fromMap(Map map) {
    return new Package(
      id: map['id'] as String,
      days: map['days'] as String,
      price: map['price'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'days': this.days,
      'price': this.price,
    } as Map<String, dynamic>;
  }
}