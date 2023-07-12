///
/// Variables
/// https://dart.dev/language/variables
///
void main() {
  var name = 'Bob';
  Object name2 = 'Bob';
  String name3 = 'Bob';

  // Null safety
  String? name4;
  String name5;

  // Default value
  int? lineCount;
  assert(lineCount == null);

  // Final and const
  final name6 = 'Bob';
  final String nickname = 'Bpbby';

  const bar = 100000;
  const double atm = 1.0132 * bar;

  var foo = const [];
  final bar2 = const [];
  const baz = [];
}

// Late variables
late String description;
