import 'package:schedule/schedule.dart';

void main() {
  Schedule schedule = Schedule(
    roles: ['OBS/YOUTUBE', 'DIREÇÃO/CORTE/CÂMERA 1', 'CÂMERA 2', 'CÂMERA 3'],
    month: 3,
    year: 2022,
  );

  print('Month: ${schedule.month}');
  print('Year: ${schedule.year}');
  print('Days: ${schedule.days}');
  print('Roles: ${schedule.roles}');

  schedule.addPerson(Person(name: 'Anne', availability: [13, 27]));
  schedule.addPerson(Person(name: 'Babu', availability: [6, 13, 20]));
  schedule.addPerson(Person(name: 'Bea', availability: [6, 13, 20]));
  schedule.addPerson(Person(name: 'Carlos', availability: []));
  schedule.addPerson(Person(name: 'Carol', availability: [6, 20]));
  schedule.addPerson(Person(name: 'Débora', availability: [13]));
  schedule.addPerson(Person(name: 'Dimis', availability: [13, 27]));
  schedule.addPerson(Person(name: 'Gabriel', availability: schedule.days));
  schedule.addPerson(Person(name: 'Giovanna', availability: [20, 27]));
  schedule.addPerson(Person(name: 'Isabel', availability: schedule.days));
  schedule.addPerson(Person(name: 'Júlia', availability: [13, 20, 27]));
  schedule.addPerson(Person(name: 'Letícia', availability: schedule.days));
  schedule.addPerson(Person(name: 'Lucas', availability: [6]));
  schedule.addPerson(Person(name: 'LF', availability: schedule.days));
  schedule.addPerson(Person(name: 'Manu', availability: [6, 13, 27]));
  schedule.addPerson(Person(name: 'Sara', availability: [6, 20]));
  schedule.addPerson(Person(name: 'Thithi', availability: [6, 13, 20]));

  print('People: ${schedule.people.map((person) => person.name).toList()}');

  schedule.buildSchedule();
  print(schedule);
}
