
class MarkedDrink{
  final int? id;
  final String json;

  MarkedDrink( this. json, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'json' : json,
    };
  }
}