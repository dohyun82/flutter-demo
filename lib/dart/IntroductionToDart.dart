/// Introduction to Dart

/// Hello World
void main() {
  print('Hello, World!');

  // Variables
  var name = '보이저1';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['Saturn'],
    'url': '//path/to/saturn.jpg'
  };

  // Control flow statements
  if (year >= 2001) {
    print('21');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  flybyObjects.where((name) => name.contains('turn')).forEach(print);

  var voyager = Spacecraft('보이저 1호', DateTime(1977, 9, 5));
  voyager.describe();
}

// Functions
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);

// Comments

// Imports

// Classes
class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

enum PlanetType{
  terrestrial, gas, ice
}

// Enums
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  uranus(planetType: PlanetType.ice, moons: 0, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 0, hasRings: true);

  const Planet({
    required this.planetType, required this.moons, required this.hasRings});

  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  bool get isGiant => planetType == PlanetType.gas || planetType == PlanetType.ice;

}
