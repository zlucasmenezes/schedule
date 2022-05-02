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
    month: 5,
    year: 2022,
    repeat: 2,
  );

  print('Month: ${schedule.month}');
  print('Year: ${schedule.year}');
  print('Days: ${schedule.days}');
  print('Roles: ${schedule.roles}');

  schedule.addPerson(
    name: 'Anne',
    availability: [8, 15, 22, 29],
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
    name: 'Carlos',
    roles: [
      roles[1],
    ],
  );
  schedule.addPerson(
    name: 'Carol',
    availability: [29],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Débora',
    availability: [1, 15, 29],
  );
  schedule.addPerson(
    name: 'Dimis',
    availability: [8, 22],
  );
  schedule.addPerson(
    name: 'Gabriel',
  );
  schedule.addPerson(
    name: 'Giovanna',
    availability: [15, 22, 29],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
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
    name: 'Júlia',
    availability: [1, 29],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Letícia',
    availability: [8, 15, 22],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Lucas',
    availability: [22],
  );
  schedule.addPerson(
    name: 'LF',
    availability: [1, 15, 29],
  );
  schedule.addPerson(
    name: 'Manu',
    availability: [15, 22],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Sara',
    availability: [1, 22, 23],
    roles: [
      roles[1],
    ],
  );

  print('People: ${schedule.people.map((person) => person.name).toList()}');

  schedule.buildSchedule();
  print(schedule);
}
