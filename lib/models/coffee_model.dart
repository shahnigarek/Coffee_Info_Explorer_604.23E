class CoffeeModel {
  final String name;
  final String imageAsset;
  final String description;

  CoffeeModel({
    required this.name,
    required this.imageAsset,
    required this.description,
  });
}
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