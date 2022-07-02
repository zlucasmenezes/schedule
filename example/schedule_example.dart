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
    month: 7,
    year: 2022,
    repeat: 2,
  );

  print('Month: ${schedule.month}');
  print('Year: ${schedule.year}');
  print('Days: ${schedule.days}');
  print('Roles: ${schedule.roles}');

  schedule.addPerson(
    name: 'Anne',
    availability: [10],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Bea',
    availability: [10, 17, 24, 31],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Carlos',
    availability: [3, 10, 17, 24, 31],
    roles: [
      roles[1],
    ],
  );
  schedule.addPerson(
    name: 'Carol',
    availability: [],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Débora',
    availability: [17, 31],
  );
  schedule.addPerson(
    name: 'Dimis',
    availability: [],
  );
  schedule.addPerson(
    name: 'Gabriel',
    availability: [3, 10, 17, 24, 31],
  );
  schedule.addPerson(
    name: 'Giovanna',
    availability: [3, 10, 17, 24, 31],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Isabel',
    availability: [10, 31],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Júlia',
    availability: [10, 24, 31],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Letícia',
    availability: [3, 10, 24, 31],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Lucas',
    availability: [24, 31],
  );
  schedule.addPerson(
    name: 'LF',
    availability: [3, 17, 31],
  );
  schedule.addPerson(
    name: 'Manu',
    availability: [3, 10],
    roles: [
      roles[1],
      roles[2],
      roles[3],
    ],
  );
  schedule.addPerson(
    name: 'Sara',
    availability: [],
    roles: [
      roles[1],
    ],
  );

  print('People: ${schedule.people.map((person) => person.name).toList()}');

  schedule.buildSchedule();
  print(schedule);
}
