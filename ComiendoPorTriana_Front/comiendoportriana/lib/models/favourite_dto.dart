class FavouriteResponse {
  FavouriteResponse({
    required this.favorito,
  });
  late final bool favorito;
  
  FavouriteResponse.fromJson(Map<String, dynamic> json){
    favorito = json['favorito'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['favorito'] = favorito;
    return _data;
  }
}