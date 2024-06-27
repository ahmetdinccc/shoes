import 'package:flutter/material.dart';
import 'package:shoes/bloc/cart_bloc.dart';
import 'package:shoes/bloc/product_bloc.dart';
import 'package:shoes/model/cart.dart';
import 'package:shoes/pages/favori.dart';
import 'package:shoes/pages/sepet.dart';
import 'package:shoes/Theme/dark_theme.dart';
import 'package:shoes/Theme/light_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Senin Ayakkabın",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text(
                  "Ahmet Talha Dinç",
                  style: TextStyle(),
                ),
                accountEmail: const Text(
                  "ahmettalhadinc50@gmail.com",
                  style: TextStyle(),
                ),
                currentAccountPicture: ClipOval(
                  child: Image.asset('lib/assets/images/person.jpeg'),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.background,
                      width: 0,
                    ),
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text('ANA SAYFAM'),
              ),
              ListTile(
                leading: const Icon(Icons.shop_outlined),
                title: const Text('SEPETİM'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Sepet(),
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite_border),
                title: const Text('FAVORİLERİM'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const favori(),
                  ));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 2 / 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              "All",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 2.2 / 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              "Sneakers",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 2.2 / 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              "Football",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 2.2 / 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              "Soccer",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildProductList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getALL(),
      stream: productBloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data.length > 0
            ? buildProductListItems(snapshot)
            : const Center(child: Text("Data Yok"));
      },
    );
  }

  Widget buildProductListItems(AsyncSnapshot snapshot) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        height: 700,
        child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, index) {
            final cart = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 20.0 / 20.0,
                      child: Image.asset(
                        cart[index].image,
                        fit: BoxFit.cover, 
                      ),
                    ),
                    Positioned(
                      bottom: 250,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cart[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            const SizedBox(height: 8.0),
                            Text(cart[index].price.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration:const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            child: IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                      "${cart[index].name} Ürün Eklendi",
                                      style:const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  action: SnackBarAction(
                                      backgroundColor: Colors.red,
                                      label: "Favori Git",
                                      textColor: Colors.white,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const favori()));
                                      }),
                                ));
                              },
                              icon:const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        const  SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration:const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            child: IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                    "${cart[index].name} Ürün Eklendi",
                                    style:const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  action: SnackBarAction(
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      label: "Sepet Git",
                                      onPressed: () {
                                        cartbloc
                                            .addToCart(Cart(cart[index], 1));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>const Sepet()));
                                      }),
                                ));
                              },
                              icon:const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
