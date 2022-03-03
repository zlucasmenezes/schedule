import 'package:schedule/schedule.dart';
import 'package:test/test.dart';

void main() {
  group("Should create an instance of Person", () {
    String name = 'Lucas';
    Person person = Person(name: name);

    test('Should instance exists', () {
      expect(person, isA<Person>());
    });

    test('Should name be correct', () {
      expect(person.name, name);
    });

    test('Should availability be correct', () {
      expect(person.availability, []);
    });

    test('Should create an instance with specific availability', () {
      List<int> availability = [1, 2, 3, 4];

      expect(Person(name: name, availability: availability).availability,
          availability);
    });
  });

  group("Should be null safety", () {
    test("availability", () {
      List<int>? availability;
      Person person = Person(name: 'Name', availability: availability);

      expect(person, isA<Person>());
    });
  });
}
