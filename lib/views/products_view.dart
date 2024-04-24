import 'package:diraction/models/product_model.dart';
import 'package:diraction/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final listController = ScrollController();
  List<Product> _products = [
    Product(
        name: "Product 1",
        imageurl: "https://picsum.photos/seed/picsum/200/300",
        description: "This is product 1",
        assetName: "car",
        price: 100,
        qty: 10),
    Product(
        name: "Product 2",
        imageurl: "https://picsum.photos/id/237/200/300",
        description: "This is product 2",
        price: 100,
        qty: 10),
    Product(
        name: "Product 3",
        description: "This is product 3",
        imageurl: "https://picsum.photos/200/300?grayscale",
        price: 100,
        qty: 10),
    Product(
        name: "Product 4",
        description: "This is product 4",
        price: 100,
        qty: 10),
    Product(
        name: "Product 5",
        imageurl: "https://picsum.photos/200/300/?blur",
        description: "This is product 5",
        price: 100,
        qty: 10),
    Product(
        name: "Product 6",
        description: "This is product 6",
        price: 100,
        qty: 10),
    Product(
        // name: "Product 6",
        description: "This is product 7",
        price: 100,
        qty: 10)
  ];

  void _showRatingsSheet(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: 500,
            height: 100,
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _products[index].updateRating(rating);
                });
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: CustomBar(
        backgroundcolor: Colors.amber,
        title: "Scrollable View",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular((20)),
                ),
                child: Image.asset(
                  'lib/assets/images/car.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                )),
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular((20)),
                ),
                child: Image.asset(
                  'lib/assets/images/car.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                )),
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular((20)),
                ),
                child: Image.asset(
                  'lib/assets/images/car.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                )),
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular((20)),
                ),
                child: Image.asset(
                  'lib/assets/images/car.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                )),
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular((20)),
                ),
                child: Image.asset(
                  'lib/assets/images/car.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fill,
                )),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Name: ${_products[0].name}" ?? "No name",
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text("Price: \$ ${_products[0].price.toString()}"),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Description: ${_products[0].description}",
            //   overflow: TextOverflow.clip,
            //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            //   softWrap: true,
            // ),
            // Text(
            //   "Rating: ${_products[0].rating.toString()}",
            //   overflow: TextOverflow.clip,
            //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            //   softWrap: true,
            // ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.yellow,
  //     appBar:
  //         CustomBar(backgroundcolor: Color(0xFF856084), title: "Products Page"),
  //     body: Column(
  //       //mainAxisSize: MainAxisSize.min,

  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Expanded(
  //           child: Container(
  //             color: Color(0xFFC1CAD6),
  //             height: 250,
  //             width: MediaQuery.of(context).size.width,
  //             child: GridView.builder(
  //                 scrollDirection: Axis.horizontal,
  //                 //padding: EdgeInsets.all(20),
  //                 itemCount: _products.length,
  //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                     crossAxisSpacing: 2,
  //                     mainAxisSpacing: 2,
  //                     crossAxisCount: 1),
  //                 itemBuilder: (context, index) {
  //                   return Card(
  //                       surfaceTintColor: Colors.white,
  //                       color: Colors.white,
  //                       shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(20)),
  //                       shadowColor: Color(0xFFC1CAD6),
  //                       child: Column(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           ClipRRect(
  //                               borderRadius: BorderRadius.only(
  //                                 topLeft: Radius.circular(20),
  //                                 topRight: Radius.circular((20)),
  //                               ),
  //                               child: Image.asset(
  //                                 'lib/assets/images/car.jpg',
  //                                 width: MediaQuery.of(context).size.width,
  //                                 height: 200,
  //                                 fit: BoxFit.fill,
  //                               )
  //                               // Image.network(
  //                               //   _products[index].imageurl,
  //                               //   width: MediaQuery.of(context).size.width,
  //                               //   height: 200,
  //                               //   fit: BoxFit.fill,
  //                               // ),
  //                               ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Name: ${_products[index].name}" ?? "No name",
  //                           ),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                               "Price: \$ ${_products[index].price.toString()}"),
  //                           SizedBox(
  //                             height: 10,
  //                           ),
  //                           Text(
  //                             "Description: ${_products[index].description}",
  //                             overflow: TextOverflow.clip,
  //                             style: TextStyle(
  //                                 fontSize: 12, fontWeight: FontWeight.bold),
  //                             softWrap: true,
  //                           ),
  //                           Text(
  //                             "Rating: ${_products[index].rating.toString()}",
  //                             overflow: TextOverflow.clip,
  //                             style: TextStyle(
  //                                 fontSize: 12, fontWeight: FontWeight.bold),
  //                             softWrap: true,
  //                           )
  //                         ],
  //                       ));

  //                   // GridTile(
  //                   //     child: Column(
  //                   //   children: [
  //                   //     Image.network(
  //                   //       _products[index].imageurl,
  //                   //       width: 50,
  //                   //       height: 100,
  //                   //       fit: BoxFit.contain,
  //                   //     ),
  //                   //     SizedBox(
  //                   //       height: 10,
  //                   //     ),
  //                   //     Text("Name: ${_products[index].name}" ?? "No name"),
  //                   //     SizedBox(
  //                   //       height: 10,
  //                   //     ),
  //                   //     Text("Price: \$ ${_products[index].price.toString()}"),
  //                   //     SizedBox(
  //                   //       height: 10,
  //                   //     ),
  //                   //     Text(
  //                   //       "Description: ${_products[index].description}",
  //                   //       overflow: TextOverflow.clip,
  //                   //       style: TextStyle(
  //                   //           fontSize: 12, fontWeight: FontWeight.bold),
  //                   //       softWrap: true,
  //                   //     ),
  //                   //     SizedBox(
  //                   //       height: 10,
  //                   //     ),
  //                   //     Text(
  //                   //       "Qty: ${_products[index].qty}",
  //                   //       overflow: TextOverflow.clip,
  //                   //       style: TextStyle(
  //                   //           fontSize: 12, fontWeight: FontWeight.bold),
  //                   //       softWrap: true,
  //                   //     )
  //                   //   ],
  //                   // ));
  //                 }),
  //           ),
  //         ),
  //         Divider(
  //           height: 2,
  //           //color: Colors.black,
  //         ),
  //         Expanded(
  //           child: Container(
  //             color: Colors.green,
  //             height: 75,
  //             width: MediaQuery.of(context).size.width,
  //             child: ListView.builder(
  //                 controller: listController,
  //                 shrinkWrap: true,

  //                 //padding: EdgeInsets.all(20),
  //                 itemCount: _products.length,
  //                 itemBuilder: (context, index) {
  //                   return ListTile(
  //                     tileColor: Colors.orangeAccent,
  //                     leading: Icon(Icons.add_box),
  //                     onTap: () {
  //                       // setState(() {
  //                       //   _products[index].restock(5);
  //                       // });
  //                       _showRatingsSheet(context, index);
  //                     },
  //                     title: Text(
  //                       "Name: ${_products[index].name}" ?? "No name",
  //                       style: TextStyle(fontFamily: "Miology"),
  //                     ),
  //                     trailing: IconButton(
  //                       icon: Icon(Icons.shop),
  //                       onPressed: () {
  //                         setState(() {
  //                           _products[index].addToCart();
  //                         });
  //                         print(_products[index].name);
  //                         print(_products[index].qty);
  //                       },
  //                     ),
  //                   );
  //                 }),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

//Implement more button
