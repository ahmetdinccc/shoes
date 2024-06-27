import 'package:flutter/material.dart';
import 'package:shoes/Theme/dark_theme.dart';
import 'package:shoes/Theme/light_theme.dart';
import 'package:shoes/bloc/cart_bloc.dart';
import 'package:shoes/pages/favori.dart';
import 'package:shoes/pages/home.dart';

class Sepet extends StatefulWidget {
  const Sepet({Key? key}) : super(key: key);

  @override
  SepetState createState() => SepetState();
}

class SepetState extends State<Sepet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text("SEPETİM"),
          centerTitle: true,
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
              ListTile(
                leading:const Icon(Icons.home),
                title:const Text('ANA SAYFAM'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Home(),
                  ));
                },
              ),
              const ListTile(
                leading: Icon(Icons.shop_outlined),
                title: Text('SEPETİM'),
              ),
              ListTile(
                leading:const Icon(Icons.favorite_border),
                title:const Text('FAVORİLERİM'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const favori(),
                  ));
                },
              ),
            ],
          ),
        ),
        body: StreamBuilder(
        stream: cartbloc.getSteram,
        initialData: cartbloc.getCart(),
      builder: (context,snapshot){
       if( snapshot.data != null){
     return buildCart(snapshot);
       }else{
        return const Text("data nulll");
       }
 
      },
    ),
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
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
                    cart[index].product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 250,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cart[index].product.name,
                          style:const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          cart[index].product.price.toString(),
                          style:const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, 
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
                            cartbloc.removeFromCart(cart[index]);
                          },
                          icon: const Icon(Icons.delete,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}