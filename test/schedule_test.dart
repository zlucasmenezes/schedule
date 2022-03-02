import 'package:schedule/schedule.dart';
import 'package:test/test.dart';

void main() {
  group("Should create an instance of Schedule", () {
    Schedule schedule = Schedule();

    test('Should instance exists', () {
      expect(schedule, isA<Schedule>());
    });

    test('Should month be current', () {
      expect(schedule.month, DateTime.now().month);
    });

    test('Should year be current', () {
      expect(schedule.year, DateTime.now().year);
    });
  });

  group("Should create an instance of Schedule with specific month", () {
    int month = DateTime.january;
    int year = 2022;
    List<int> expectedDays = [2, 9, 16, 23, 30];
    Schedule schedule = Schedule(month: month, year: year);

    test('Should instance exists', () {
      expect(schedule, isA<Schedule>());
    });

    test('Should month be correct', () {
      expect(schedule.month, month);
    });

    test('Should year be correct', () {
      expect(schedule.year, year);
    });

    test('Should get days of month', () {
      expect(schedule.days, expectedDays);
    });
  });

  group("Should create an instance of Schedule with specific roles", () {
    List<String> expectedRoles = [
      'Specific role 1',
      'Specific role 2',
      'Specific role 3'
    ];
    Schedule schedule = Schedule(roles: expectedRoles);

    test('Should instance exists', () {
      expect(schedule, isA<Schedule>());
    });

    test('Should roles be correct', () {
      expect(schedule.roles, expectedRoles);
    });
  });

  group("Should add people", () {
    int month = DateTime.january;
    int year = 2022;
    Schedule schedule = Schedule(month: month, year: year);
    String name = 'Lucas';

    test('Should add person', () {
      Person person = Person(name: name);
      schedule.addPerson(person);

      expect(schedule.people, [person]);
    });

    test('Should add person with specific availability', () {
      Person person = Person(name: name, availability: [2, 9]);
      schedule.addPerson(person);

      expect(schedule.people, [person]);
    });

    test('Should add person with wrong availability', () {
      Person person = Person(name: name, availability: [1, 8]);
      schedule.addPerson(person);

      expect(schedule.people, [person]);
      expect(schedule.people[0].availability, []);
    });

    test('Should update person\'s availability when add the same person', () {
      schedule.addPerson(Person(name: name, availability: [2, 9]));

      expect(schedule.people[0].availability, [2, 9]);

      schedule.addPerson(Person(name: name, availability: [2, 16]));

      expect(schedule.people.length, 1);
      expect(schedule.people[0].availability, [2, 16]);
    });
  });
}
