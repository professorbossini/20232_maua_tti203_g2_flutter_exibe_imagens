class ImageModel {
  late String url;
  late String alt;

  ImageModel(this.url, this.alt);

  //named constructor
  ImageModel.fromJSON(Map<String, dynamic> decodedJSON) {
    url = decodedJSON['photos'][0]['src']['medium'];
    alt = decodedJSON['photos'][0]['alt'];
  }
}
