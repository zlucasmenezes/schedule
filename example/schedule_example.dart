import 'package:schedule/schedule.dart';

void main() {
  Schedule schedule = Schedule(month: 1, year: 2022);

  schedule.addPerson(Person(name: 'Willie', availability: schedule.days));
  schedule.addPerson(Person(name: 'Ricky', availability: [2, 9, 16, 23, 30]));
  schedule.addPerson(Person(name: 'Ricky', availability: [2, 9, 30]));
  schedule.addPerson(Person(name: 'Angel', availability: [2, 9, 16]));
  schedule.addPerson(Person(name: 'Patrick', availability: [2, 23, 30]));
  schedule.addPerson(Person(name: 'Melvin'));
  schedule.addPerson(Person(name: 'Donald', availability: [2, 16, 30]));

  print('Month: ${schedule.month}');
  print('Year: ${schedule.year}');
  print('Days: ${schedule.days}');
  print('Roles: ${schedule.roles}');
  print('People: ${schedule.people.map((person) => person.name).toList()}');
}
