//name TEXT,address TEXT, phone INTEGER,id_number INTEGER,item TEXT,total_item INTEGER, monthly INTEGER, period INTEGER
class Premium {
  final int? id;
  final String name;
  final String address;
  final int phone;
  final int idNumber;
  final String item;
  final int totalItem;
  final int monthly;
  final int period;

  Premium({
    this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.idNumber,
    required this.item,
    required this.totalItem,
    required this.monthly,
    required this.period,
  });

  Premium.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        address = res["address"],
        phone = res["phone"],
        idNumber = res['id_number'],
        item = res['item'],
        totalItem = res['total_item'],
        monthly = res['monthly'],
        period = res['period'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'id_number': idNumber,
      'item': item,
      'total_item': totalItem,
      'monthly': monthly,
      'period ': period
    };
  }
}
