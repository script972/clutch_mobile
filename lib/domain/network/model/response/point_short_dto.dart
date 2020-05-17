class PointShortDto {
  int id;
  String title;
  String address;
  double lat;
  double lng;
  double distance;
  String image;

  PointShortDto(
      {this.id,
      this.title,
      this.address,
      this.lat,
      this.lng,
      this.distance,
      this.image});

  factory PointShortDto.fromMap(Map<String, dynamic> json) => PointShortDto(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "address": address,
        "lat": lat,
        "lng": lng,
        "distance": distance,
      };
}
