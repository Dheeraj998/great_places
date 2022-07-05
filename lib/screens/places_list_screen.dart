import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceCSreen.routes);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: Provider.of<Greatplaces>(context, listen: false)
                  .fetchAndSetPlaces(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<Greatplaces>(
                        builder: (context, greatplaces, child) {
                          return greatplaces.items.isEmpty
                              ? const Center(child: Text('no places'))
                              : ListView.builder(
                                  itemCount: greatplaces.items.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: FileImage(
                                          greatplaces.items[index].image,
                                        ),
                                      ),
                                      title:
                                          Text(greatplaces.items[index].title),
                                    );
                                  },
                                );
                        },
                      );
              })),
    );
  }
}
