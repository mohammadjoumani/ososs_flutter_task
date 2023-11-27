class PokemonResponseDto {
  String? name;
  String? url;

  PokemonResponseDto({this.name, this.url});

  PokemonResponseDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  static List<PokemonResponseDto> fromJsonList(dynamic jsonList) {
    return (jsonList as List<dynamic>)
        .map((item) => PokemonResponseDto.fromJson(item))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
