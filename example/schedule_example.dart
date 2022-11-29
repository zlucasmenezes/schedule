import 'package:schedule/schedule.dart';

void main() {
  List<String> roles = [
    'OBS/YOUTUBE/ÁUDIO',
    'DIREÇÃO/CORTE/CÂMERA 1',
    'CÂMERA 2',
    'CÂMERA 3',
  ];

  Schedule schedule = Schedule(
    title: 'ESCALA LIVE',
    roles: roles,
    daysOfWeek: [DateTime.sunday],
    days: [4, 11, 18],
    month: DateTime.december,
    year: 2022,
    repeat: 2,
  );

  print('Month: ${schedule.month}');
  print('Year: ${schedule.year}');
  print('Days: ${schedule.days}');
  print('Roles: ${schedule.roles}');

  schedule.addPerson(
    name: 'Anne',
    availability: [18],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );

  schedule.addPerson(
    name: 'Bea',
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );

  schedule.addPerson(
    name: 'Branco',
    roles: [roles[0]],
  );

  schedule.addPerson(
    name: 'Carlos Gabriel',
    availability: [4],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );

  schedule.addPerson(
    name: 'Débora',
    availability: [11, 18],
  );

  schedule.addPerson(
    name: 'Dimis',
    availability: [],
  );

  schedule.addPerson(
    name: 'Gabriel',
  );

  schedule.addPerson(
    name: 'Giovanna',
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
    priority: 2,
  );

  schedule.addPerson(
    name: 'Isabel',
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );

  schedule.addPerson(
    name: 'Jorge',
    availability: [],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );

  schedule.addPerson(
    name: 'Júlia',
    availability: [4, 18],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );

  schedule.addPerson(
    name: 'Letícia',
    availability: [4, 18],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );

  schedule.addPerson(
    name: 'Lucas',
    availability: [],
  );

  schedule.addPerson(
    name: 'LF',
    availability: [11, 18],
  );

  schedule.addPerson(
    name: 'Manu',
    availability: [],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );

  schedule.addPerson(
    name: 'Milla',
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
    priority: 1,
  );

  schedule.addPerson(
    name: 'Sara',
    availability: [],
    roles: [
      roles[1],
    ],
  );

  schedule.addPerson(
    name: 'Théo',
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
    priority: 1,
  );

  print('People: ${schedule.people.map((person) => person.name).toList()}');

  schedule.buildSchedule();
  print(schedule);
}
