void main(List<String> args) {
  lists();
  print('done.');
  sets();
  print('done.');
  maps();
  print('done.');
  common();
  print('done.');
}

// Lists
void lists() {
  f1();
  f2();
  f3();
  f4();
}

// Sets
void sets() {
  f5();
  f6();
  f7();
}

// Maps
void maps() {
  f8();
  f9();
  f10();
  f11();
  f12();
}

// 公共集合方法
void common() {
  f13();
  f14();
}

//lists 可以通过字面量来创建和初始化
void f1() {
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

  // Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

  // Add to a list.
  fruits.add('kiwis');

  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

  // Get the list length.
  assert(fruits.length == 5);

  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  // Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

  // You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));
}

//使用 indexOf() 方法查找一个对象在 list 中的下标值。
void f2() {
  var fruits = ['apples', 'oranges'];

  // Access a list item by index.
  assert(fruits[0] == 'apples');

  // Find an item in a list.
  assert(fruits.indexOf('apples') == 0);
}

//使用 sort() 方法排序一个 list 。
void f3() {
  var fruits = ['bananas', 'apples', 'oranges'];

  // Sort a list.
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
}

//列表是参数化类型（泛型），因此可以指定 list 应该包含的元素类型：
void f4() {
  // This list should contain only strings.
  var fruits = <String>[];

  fruits.add('apples');
  var fruit = fruits[0];
  // ignore: unnecessary_type_check
  assert(fruit is String);
}

//set 是一个无序的，元素唯一的集合。
void f5() {
  // Create an empty set of strings.
  var ingredients = <String>{};

  // Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

  // Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  // You can also create sets using
  // one of the constructors.
  // ignore: unused_local_variable
  var atomicNumbers = Set.from([79, 22, 54]);
}

//使用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中：
void f6() {
  var ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  // Check whether an item is in the set.
  assert(ingredients.contains('titanium'));

  // Check whether all the items are in the set.
  assert(ingredients.containsAll(['titanium', 'xenon']));
}

//交集是另外两个 set 中的公共元素组成的 set。
void f7() {
  var ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  // Create the intersection of two sets.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

//声明 map 可以使用简洁的字面量语法，也可以使用传统构造函数：
void f8() {
  // Maps often use strings as keys.
  // ignore: unused_local_variable
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // Maps can be built from a constructor.
  // ignore: unused_local_variable
  var searchTerms = Map();

  // Maps are parameterized types; you can specify what
  // types the key and value should be.
  // ignore: unused_local_variable
  var nobleGases = Map<int, String>();
}

//通过大括号语法可以为 map 添加，获取，设置元素。使用 remove() 方法从 map 中移除键值对。
void f9() {
  var nobleGases = {54: 'xenon'};

  // Retrieve a value with a key.
  assert(nobleGases[54] == 'xenon');

  // Check whether a map contains a key.
  assert(nobleGases.containsKey(54));

  // Remove a key and its value.
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));
}

//可以从一个 map 中检索出所有的 key 或所有的 value：
void f10() {
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // Get all the keys as an unordered collection
  // (an Iterable).
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  // Get all the values as an unordered collection
  // (an Iterable of Lists).
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));
}

//使用 containsKey() 方法检查一个 map 中是否包含某个key 。
void f11() {
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));
}

//如果当且仅当该 key 不存在于 map 中，且要为这个 key 赋值，可使用 putIfAbsent() 方法。
void f12() {
  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => 'value');
  assert(teamAssignments['Catcher'] != null);
}

//List, Set, 和 Map 共享许多集合中的常用功能。其中一些常见功能由 Iterable 类定义，这些函数由 List 和 Set 实现
void f13() {
  //使用 isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素：
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  //使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法。
  teas.forEach((tea) => print('I drink $tea'));

  //当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）：
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });

  //Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中。
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  //使用 map().toList() 或 map().toSet() ，可以强制在每个项目上立即调用函数。
  loudTeas = teas.map((tea) => tea.toUpperCase()).toList();
}

//使用 Iterable 的 where() 方法可以获取所有匹配条件的元素。
void f14() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  // Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  // Use where() to find only the items that return true
  // from the provided function.
  // ignore: unused_local_variable
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  // or teas.where(isDecaffeinated)

  // Use any() to check whether at least one item in the
  // collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

  // Use every() to check whether all the items in a
  // collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));
}
