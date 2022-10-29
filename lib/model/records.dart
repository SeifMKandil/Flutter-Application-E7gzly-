class Records {
  final int id;
  final String name;

  Records(this.name, this.id);

  Records.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['name'] != null),
        id = map['id'],
        name = map['name'];

  @override
  String toString() {
    return " $name";
  }
}
