abstract interface class Mapper<T> {
  factory Mapper.fromJson(Map<String, dynamic> json){
    throw Exception();
  }

  Map<String, dynamic> toJson();
}