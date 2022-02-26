import 'package:flutter/material.dart';
import 'package:base_response_flutter/RickyMorties/ricky_morties_viewmodel.dart';
import 'package:kartal/kartal.dart';

class RickyMortiesView extends RickMortiesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchAllData();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Rick and Morty"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: context.horizontalPaddingLow,
            child: Card(
              elevation: 4,
              shadowColor: context.appTheme.primaryColor,
              shape: const RoundedRectangleBorder(),
              child: ListTile(
                title: Text(models[index].name ?? ""),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(models[index].image ??
                      "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
