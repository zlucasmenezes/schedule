import 'package:schedule/schedule.dart';
import 'package:schedule/src/person.dart';
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

    test('It should repeat be 1', () {
      expect(schedule.repeat, 1);
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

  group("It should create an instance of Schedule with specific repeat", () {
    int repeat = 4;
    Schedule schedule = Schedule(repeat: repeat);

    test('It should instance exists', () {
      expect(schedule, isA<Schedule>());
    });

    test('It should repeat be correct', () {
      expect(schedule.repeat, repeat);
    });
  });

  group("It should add people", () {
    int month = DateTime.january;
    int year = 2022;
    String name = 'Lucas';
    late Schedule schedule;
    List<String> roles = ['Role 1', 'Role 2'];

    setUp(() {
      schedule = Schedule(month: month, year: year, roles: roles);
    });

    test('It should add person', () {
      Person person = Person(name: name);
      schedule.addPerson(name: person.name);

      expect(schedule.people[0].name, person.name);
      expect(schedule.people[0].availability, schedule.days);
      expect(schedule.people[0].roles, schedule.roles);
    });

    test('It should add person with specific availability', () {
      Person person = Person(name: name, availability: [2, 9]);
      schedule.addPerson(name: person.name, availability: person.availability);

      expect(schedule.people[0].name, person.name);
      expect(schedule.people[0].availability, person.availability);
      expect(schedule.people[0].roles, schedule.roles);
    });

    test('It should add person with wrong availability', () {
      Person person = Person(name: name, availability: [1, 8]);
      schedule.addPerson(name: person.name, availability: person.availability);

      expect(schedule.people[0].name, person.name);
      expect(schedule.people[0].availability, []);
      expect(schedule.people[0].roles, schedule.roles);
    });

    test('It should add person with specific roles', () {
      Person person = Person(name: name, roles: [roles[0]]);
      schedule.addPerson(name: person.name, roles: person.roles);

      expect(schedule.people[0].name, person.name);
      expect(schedule.people[0].availability, schedule.days);
      expect(schedule.people[0].roles, [roles[0]]);
    });

    test('It should add person with wrong roles', () {
      Person person =
          Person(name: name, roles: ['Wrong role 1', 'Wrong role 2']);
      schedule.addPerson(name: person.name, roles: person.roles);

      expect(schedule.people[0].name, person.name);
      expect(schedule.people[0].availability, schedule.days);
      expect(schedule.people[0].roles, []);
    });

    test('It should update person\'s availability when add the same person',
        () {
      schedule.addPerson(name: name, availability: [2, 9]);

      expect(schedule.people[0].availability, [2, 9]);

      schedule.addPerson(name: name, availability: [2, 16]);

      expect(schedule.people.length, 1);
      expect(schedule.people[0].availability, [2, 16]);
    });

    test('It should update person\'s roles when add the same person', () {
      schedule.addPerson(name: name, roles: [roles[0]]);

      expect(schedule.people[0].roles, [roles[0]]);

      schedule.addPerson(name: name, roles: [roles[1]]);

      expect(schedule.people.length, 1);
      expect(schedule.people[0].roles, [roles[1]]);
    });
  });

  group("It should build schedule", () {
    late Schedule schedule;
    List<String> roles = ['Role 1', 'Role 2'];

    setUp(() {
      schedule = Schedule(
        roles: roles,
        month: 3,
        year: 2022,
      );
    });

    test("It should build a complete schedule", () {
      schedule.addPerson(
        name: 'Kevin',
        availability: schedule.days,
        roles: roles,
      );
      schedule.addPerson(
        name: 'Iva',
        availability: schedule.days,
        roles: roles,
      );
      schedule.addPerson(
        name: 'Jean',
        availability: schedule.days,
        roles: roles,
      );
      schedule.addPerson(
        name: 'Ina',
        availability: schedule.days,
        roles: roles,
      );
      schedule.addPerson(
        name: 'Virgie',
        availability: schedule.days,
        roles: roles,
      );
      schedule.addPerson(
        name: 'Georgie',
        availability: schedule.days,
        roles: roles,
      );
      schedule.addPerson(
        name: 'Sue',
        availability: schedule.days,
        roles: roles,
      );
      schedule.addPerson(
        name: 'Leonard',
        availability: schedule.days,
        roles: roles,
      );

      var builtSchedule = schedule.buildSchedule();

      expect(
        builtSchedule[6]!.values.whereType<String>().length,
        schedule.roles.length,
      );
      expect(
        builtSchedule[13]!.values.whereType<String>().length,
        schedule.roles.length,
      );
      expect(
        builtSchedule[20]!.values.whereType<String>().length,
        schedule.roles.length,
      );
      expect(
        builtSchedule[27]!.values.whereType<String>().length,
        schedule.roles.length,
      );
    });

    test("It should build an incomplete schedule", () {
      schedule.addPerson(
        name: 'Kevin',
        availability: [6],
        roles: roles,
      );
      schedule.addPerson(
        name: 'Iva',
        availability: [6],
        roles: roles,
      );
      schedule.addPerson(
        name: 'Jean',
        availability: [13],
        roles: roles,
      );
      schedule.addPerson(
        name: 'Virgie',
        availability: [20],
        roles: roles,
      );
      schedule.addPerson(
        name: 'Sue',
        availability: [27],
        roles: roles,
      );
      schedule.addPerson(
        name: 'Leonard',
        availability: [27],
        roles: roles,
      );

      var builtSchedule = schedule.buildSchedule();

      expect(
        builtSchedule[6]!.values.whereType<String>().length,
        schedule.roles.length,
      );
      expect(
        builtSchedule[13]!.values.whereType<String>().length,
        schedule.roles.length - 1,
      );
      expect(
        builtSchedule[20]!.values.whereType<String>().length,
        schedule.roles.length - 1,
      );
      expect(
        builtSchedule[27]!.values.whereType<String>().length,
        schedule.roles.length,
      );
    });

    test("It should build schedule repeating people", () {
      schedule = Schedule(month: 3, year: 2022, repeat: 4);
      schedule.addPerson(name: 'Kevin');
      schedule.addPerson(name: 'Iva');
      schedule.addPerson(name: 'Jean');
      schedule.addPerson(name: 'Virgie');

      var builtSchedule = schedule.buildSchedule();

      expect(
        builtSchedule[6]!.values.whereType<String>().length,
        schedule.roles.length,
      );
      expect(
        builtSchedule[13]!.values.whereType<String>().length,
        schedule.roles.length,
      );
      expect(
        builtSchedule[20]!.values.whereType<String>().length,
        schedule.roles.length,
      );
      expect(
        builtSchedule[27]!.values.whereType<String>().length,
        schedule.roles.length,
      );
    });
  });

  group("It should be null safety", () {
    test("Schedule", () {
      expect(
        Schedule(
            roles: null, month: null, year: null, title: null, repeat: null),
        isA<Schedule>(),
      );
    });

    test("addPerson", () {
      var schedule = Schedule();
      schedule.addPerson(name: null, availability: null, roles: null);

      expect(schedule.people.length, 0);
    });
  });
}
