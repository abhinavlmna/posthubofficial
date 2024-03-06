class Post {
  String? id;

  late String caption;
  late String addcategory;
  late String discription;
  late String budget;
  late String startdate;
  late String enddate;
  late String location;
  late String agestart;
  late String ageend;
  late bool rejected;
  late String gender;
  late String keywords;
  late String url;
  late String totalviews;
  late String moneyspent;

  Post(
      {this.id,
      required this.caption,
      required this.addcategory,
      required this.discription,
      required this.budget,
      required this.startdate,
      required this.enddate,
      required this.location,
      required this.agestart,
      required this.ageend,
      required this.rejected,
      required this.gender,
      required this.keywords,
      required this.url,
      required this.totalviews,
        required this.moneyspent});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'caption': caption,
      'addcategory': addcategory,
      'discription': discription,
      'budget': budget,
      'startdate': startdate,
      'enddate': enddate,
      'location': location,
      'agestart': agestart,
      'ageend': ageend,
      'rejected': false,
      'gender': gender,
      'keywords': keywords,
      'url': url,
      'totalviews': totalviews,
      'moneyspent' :moneyspent
    };
  }
}
