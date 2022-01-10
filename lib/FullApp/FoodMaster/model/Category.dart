class Category {
  String id;
  String name;
  String restorantid;
  String createdat;
  String updatedat;
  String orderindex;
  String active;
  Category({
    this.id,
    this.name,
    this.restorantid,
    this.createdat,
    this.updatedat,
    this.orderindex,
    this.active,
  });

  /*factory Category.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      restorantid: map['restorant_id'].toString(),
      createdat: map['created_at'],
      updatedat: map['updated_at'],
      orderindex: map['order_index'].toString(),
      active: map['active'].toString(),
    );
  }*/
}
