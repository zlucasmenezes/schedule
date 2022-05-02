import 'package:schedule/src/person.dart';
import 'package:test/test.dart';

void main() {
  group("It should create an instance of Person", () {
    String name = 'Lucas';
    Person person = Person(name: name);

    test('It should instance exists', () {
      expect(person, isA<Person>());
    });

    test('It should name be correct', () {
      expect(person.name, name);
    });

    test('It should availability be correct', () {
      expect(person.availability, []);
    });

    test('It should create an instance with specific availability', () {
      List<int> availability = [1, 2, 3, 4];

      expect(Person(name: name, availability: availability).availability,
          availability);
    });

    test('It should roles be correct', () {
      expect(person.roles, []);
    });

    test('It should create an instance with specific roles', () {
      List<String> roles = ['Role 1', 'Role 2'];

      expect(Person(name: name, roles: roles).roles, roles);
    });
  });

  group("It should be null safety", () {
    test("availability", () {
      List<int>? availability;
      Person person = Person(name: 'Name', availability: availability);

      expect(person, isA<Person>());
    });

    test("roles", () {
      List<String>? roles;
      Person person = Person(name: 'Name', roles: roles);

      expect(person, isA<Person>());
    });
  });
}
