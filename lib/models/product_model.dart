class Product {
  final String imageurl;
  final String? name;
  double price;
  final String? description;
  final String assetName;
  double rating;
  int qty;

  Product(
      {this.imageurl = "https://picsum.photos/200/250",
      this.assetName = "car",
      this.name,
      this.description,
      this.rating = 0,
      this.price = 0,
      this.qty = 0});

  void addToCart() {
    this.qty--;
  }

  void restock(int newStock) {
    this.qty += newStock;
  }

  void discount(int percentDiscount) {
    this.price = (1 - percentDiscount / 100) * this.price;
  }

  void updateRating(double newRating) {
    rating = newRating;
  }

  double ratingGetter() {
    return rating;
  }

  double get getrating => rating;
}
