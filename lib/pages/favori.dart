import 'package:flutter/material.dart';
import 'package:shoes/Theme/dark_theme.dart';
import 'package:shoes/Theme/light_theme.dart';
import 'package:shoes/pages/sepet.dart';

import 'package:shoes/pages/home.dart';
class favori extends StatefulWidget {
  const favori({super.key});

  @override
  State<favori> createState() => favoriState();
}

class favoriState extends State<favori> {
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
          title: const Text("FAVORİLERİM"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text(
                  "Ahmet Talha Dinç",
                  style: TextStyle(
                      // color: Theme.of(context).colorScheme.primary
                      ),
                ),
                accountEmail: const Text(
                  "ahmettalhadinc50@gmail.com",
                  style: TextStyle(
                      // color: Theme.of(context).colorScheme.primary,

                      ),
                ),
                currentAccountPicture: ClipOval(
                  child: Image.asset('lib/assets/images/person.jpeg'),
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).colorScheme.background,
                            width: 0))),
              ),
               ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'ANA SAYFAM',
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text(
                  'SEPETİM',
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const Sepet()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text('FAVORİLERİM'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
