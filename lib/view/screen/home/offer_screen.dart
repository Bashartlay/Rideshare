import 'package:flutter/material.dart';
import 'package:rideshare/resources/app_strings.dart';
import 'package:rideshare/view/widgets/drawer.dart';
import 'package:rideshare/view/widgets/listtile.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.Offer),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.of(context).pop(); 
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ContainerOffer(rate: 15, containt: 'Black Friday'),
              ContainerOffer(rate: 5, containt: 'Crismus'),
              ContainerOffer(rate: 25, containt: 'Happy New Year'),
              ContainerOffer(rate: 15, containt: 'Black Friday'),
              ContainerOffer(rate: 5, containt: 'Crismus'),
              ContainerOffer(rate: 25, containt: 'Happy New Year'),
              ContainerOffer(rate: 15, containt: 'Black Friday'),
              ContainerOffer(rate: 5, containt: 'Crismus'),
              ContainerOffer(rate: 25, containt: 'Happy New Year'),
              ContainerOffer(rate: 15, containt: 'Black Friday'),
              ContainerOffer(rate: 5, containt: 'Crismus'),
              ContainerOffer(rate: 25, containt: 'Happy New Year'),
            ],
          ),
        ),
      ),
    );
  }
}
