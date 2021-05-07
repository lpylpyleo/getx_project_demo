abstract class Serializable<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> src);
}
