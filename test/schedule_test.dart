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
}
