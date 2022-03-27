import 'package:schedule/schedule.dart';
import 'package:test/test.dart';

void main() {
  group("It should create an instance of Schedule", () {
    Schedule schedule = Schedule();

    test('It should instance exists', () {
      expect(schedule, isA<Schedule>());
    });

    test('It should month be current', () {
      expect(schedule.month, DateTime.now().month);
    });

    test('It should year be current', () {
      expect(schedule.year, DateTime.now().year);
    });
  });

  group("It should create an instance of Schedule with specific month", () {
    int month = DateTime.january;
    int year = 2022;
    List<int> expectedDays = [2, 9, 16, 23, 30];
    Schedule schedule = Schedule(month: month, year: year);

    test('It should instance exists', () {
      expect(schedule, isA<Schedule>());
    });

    test('It should month be correct', () {
      expect(schedule.month, month);
    });

    test('It should year be correct', () {
      expect(schedule.year, year);
    });

    test('It should get days of month', () {
      expect(schedule.days, expectedDays);
    });
  });

  group("It should create an instance of Schedule with specific roles", () {
    List<String> expectedRoles = [
      'Specific role 1',
      'Specific role 2',
      'Specific role 3'
    ];
    Schedule schedule = Schedule(roles: expectedRoles);

    test('It should instance exists', () {
      expect(schedule, isA<Schedule>());
    });

    test('It should roles be correct', () {
      expect(schedule.roles, expectedRoles);
    });
  });

  group("It should create an instance of Schedule with specific title", () {
    String title = 'Title';
    Schedule schedule = Schedule(title: title);

    test('It should instance exists', () {
      expect(schedule, isA<Schedule>());
    });

    test('It should title be correct', () {
      expect(schedule.title, title);
    });
  });

  group("It should add people", () {
    int month = DateTime.january;
    int year = 2022;
    String name = 'Lucas';
    late Schedule schedule;

    setUp(() {
      schedule = Schedule(month: month, year: year);
    });

    test('It should add person', () {
      Person person = Person(name: name);
      schedule.addPerson(person);

      expect(schedule.people, [person]);
    });

    test('It should add person with specific availability', () {
      Person person = Person(name: name, availability: [2, 9]);
      schedule.addPerson(person);

      expect(schedule.people, [person]);
    });

    test('It should add person with wrong availability', () {
      Person person = Person(name: name, availability: [1, 8]);
      schedule.addPerson(person);

      expect(schedule.people, [person]);
      expect(schedule.people[0].availability, []);
    });

    test('It should update person\'s availability when add the same person',
        () {
      schedule.addPerson(Person(name: name, availability: [2, 9]));

      expect(schedule.people[0].availability, [2, 9]);

      schedule.addPerson(Person(name: name, availability: [2, 16]));

      expect(schedule.people.length, 1);
      expect(schedule.people[0].availability, [2, 16]);
    });
  });

  group("It should build schedule", () {
    late Schedule schedule;

    setUp(() {
      schedule = Schedule(
        roles: ['Role 1', 'Role 2'],
        month: 3,
        year: 2022,
      );
    });

    test("It should build a complete schedule", () {
      schedule.addPerson(Person(name: 'Kevin', availability: schedule.days));
      schedule.addPerson(Person(name: 'Iva', availability: schedule.days));
      schedule.addPerson(Person(name: 'Jean', availability: schedule.days));
      schedule.addPerson(Person(name: 'Ina', availability: schedule.days));
      schedule.addPerson(Person(name: 'Virgie', availability: schedule.days));
      schedule.addPerson(Person(name: 'Georgie', availability: schedule.days));
      schedule.addPerson(Person(name: 'Sue', availability: schedule.days));
      schedule.addPerson(Person(name: 'Leonard', availability: schedule.days));

      var builtSchedule = schedule.buildSchedule().map((key, value) =>
          MapEntry(key, value.values.whereType<String>().length));

      expect(builtSchedule[6], schedule.roles.length);
      expect(builtSchedule[13], schedule.roles.length);
      expect(builtSchedule[20], schedule.roles.length);
      expect(builtSchedule[27], schedule.roles.length);
    });

    test("It should build an incomplete schedule", () {
      schedule.addPerson(Person(name: 'Kevin', availability: [6]));
      schedule.addPerson(Person(name: 'Iva', availability: [6]));
      schedule.addPerson(Person(name: 'Jean', availability: [13]));
      schedule.addPerson(Person(name: 'Virgie', availability: [20]));
      schedule.addPerson(Person(name: 'Sue', availability: [27]));
      schedule.addPerson(Person(name: 'Leonard', availability: [27]));

      var builtSchedule = schedule.buildSchedule().map((key, value) =>
          MapEntry(key, value.values.whereType<String>().length));

      expect(builtSchedule[6], schedule.roles.length);
      expect(builtSchedule[13], schedule.roles.length - 1);
      expect(builtSchedule[20], schedule.roles.length - 1);
      expect(builtSchedule[27], schedule.roles.length);
    });
  });

  group("It should be null safety", () {
    test("Schedule", () {
      expect(
        Schedule(roles: null, month: null, year: null, title: null),
        isA<Schedule>(),
      );
    });

    test("addPerson", () {
      var schedule = Schedule();
      expect(schedule.addPerson(null), null);
    });
  });
}
