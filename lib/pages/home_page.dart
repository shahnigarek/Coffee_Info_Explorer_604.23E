import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../widgets/coffee_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final List<CoffeeModel> coffees = [
    CoffeeModel(
      name: 'Affogato',
      imageAsset: 'assets/images/affogato.jpg',
      description: 'Espresso over vanilla ice cream.',
    ),
    CoffeeModel(
      name: 'Frappe',
      imageAsset: 'assets/images/frappe.jpg',
      description: 'Blended iced coffee with foam.',
    ),
    CoffeeModel(
      name: 'Espresso',
      imageAsset: 'assets/images/espresso.jpg',
      description: 'Strong, concentrated coffee shot.',
    ),
    CoffeeModel(
      name: 'Cappuccino',
      imageAsset: 'assets/images/cappuccino.jpeg',
      description: 'Espresso with milk and foam.',
    ),
    CoffeeModel(
      name: 'Macchiato',
      imageAsset: 'assets/images/macchiato.jpg',
      description: 'Espresso with a touch of foam.',
    ),
    CoffeeModel(
      name: 'Mocha',
      imageAsset: 'assets/images/mocha.jpg',
      description: 'Espresso with milk and chocolate.',
    ),
    CoffeeModel(
      name: 'Latte',
      imageAsset: 'assets/images/latte.jpg',
      description: 'Espresso with lots of steamed milk.',
    ),
    CoffeeModel(
      name: 'Americano',
      imageAsset: 'assets/images/americano.jpg',
      description: 'Espresso diluted with hot water.',
    ),
    CoffeeModel(
      name: 'Irish Coffee',
      imageAsset: 'assets/images/irish.jpeg',
      description: 'Coffee mixed with Irish whiskey.',
    ),
    CoffeeModel(
      name: 'Cortado',
      imageAsset: 'assets/images/cortado.jpg',
      description: 'Espresso with equal steamed milk.',
    ),
    CoffeeModel(
      name: 'Lungo',
      imageAsset: 'assets/images/lungo.jpg',
      description: 'Longer espresso with more water.',
    ),
    CoffeeModel(
      name: 'Flat White',
      imageAsset: 'assets/images/flatwhite.jpg',
      description: 'Espresso with smooth microfoam.',
    ),
    CoffeeModel(
      name: 'Iced Coffee',
      imageAsset: 'assets/images/icedcoffee.jpeg',
      description: 'Chilled coffee served over ice.',
    ),
    CoffeeModel(
      name: 'Turkish Coffee',
      imageAsset: 'assets/images/turkishcoffee.jpg',
      description: 'Strong, thick unfiltered coffee.',
    ),
    CoffeeModel(
      name: 'Drip Coffee',
      imageAsset: 'assets/images/dripcoffee.jpg',
      description: 'Brewed by dripping hot water.',
    ),
    CoffeeModel(
      name: 'Red Eye',
      imageAsset: 'assets/images/Red-Eye.jpg',
      description: 'Drip coffee with an espresso shot.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [_buildHeader(), _buildSection(coffees)]),
    );
  }

  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            height: 730,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcomingphoto.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(height: 730, color: Colors.black.withOpacity(0.3)),
          Positioned(
            bottom: 320,
            left: 100,
            right: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Life’s too short for bad coffee.',
                  style: GoogleFonts.robotoMono(
                    fontSize: 44,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Luckily, you’re in the right place.',
                    style: GoogleFonts.robotoMono(
                      fontSize: 44,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildSection(List<CoffeeModel> coffees) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),

              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: coffees.length,
                padding: const EdgeInsets.only(top: 50, bottom: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.95,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 30,
                ),
                itemBuilder:
                    (context, index) => CoffeeCard(coffee: coffees[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
