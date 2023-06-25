//比较对象
import 'dart:collection';

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

//Implementing map keys
class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

//迭代
class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  // We'll use a List to store our processes
  final List<Process> _processes = [];

  // We'll keep track of the current index when iterating the List
  int _current = 0;

  ProcessIterator() {
    // For demonstration purposes, let's create some processes
    _processes.add(Process());
    _processes.add(Process());
    _processes.add(Process());
  }

  @override
  Process get current => _processes[_current];

  @override
  bool moveNext() {
    // If we're at the end of the List, moveNext() returns false
    if (_current == _processes.length - 1) {
      return false;
    }

    // Otherwise, move to the next process and return true
    _current++;
    return true;
  }
}

// A mythical class that lets you iterate through all
// processes. Extends a subclass of [Iterable].
class Processes extends IterableBase<Process> {
  @override
  final Iterator<Process> iterator = ProcessIterator();
}

void main() {
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);

  // Iterable objects can be used with for-in.
  // ignore: unused_local_variable
  for (final process in Processes()) {
    // Do something with the process.
  }
}
