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
  );

  print('Month: ${schedule.month}');
  print('Year: ${schedule.year}');
  print('Days: ${schedule.days}');
  print('Roles: ${schedule.roles}');

  schedule.addPerson(
    Person(
      name: 'Anne',
      availability: [8, 15, 22, 29],
      roles: [
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Bea',
      availability: schedule.days,
      roles: [
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Carlos',
      availability: schedule.days,
      roles: [
        roles[1],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Carol',
      availability: [29],
      roles: [
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Débora',
      availability: [1, 15, 29],
      roles: [
        roles[0],
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Dimis',
      availability: [8, 22],
      roles: [
        roles[0],
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Gabriel',
      availability: schedule.days,
      roles: [
        roles[0],
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Giovanna',
      availability: [15, 22, 29],
      roles: [
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Isabel',
      availability: schedule.days,
      roles: [
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Júlia',
      availability: [1, 29],
      roles: [
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Letícia',
      availability: [8, 15, 22],
      roles: [
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Lucas',
      availability: [22],
      roles: [
        roles[0],
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'LF',
      availability: [1, 15, 29],
      roles: [
        roles[0],
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Manu',
      availability: [15, 22],
      roles: [
        roles[1],
        roles[2],
        roles[3],
      ],
    ),
  );
  schedule.addPerson(
    Person(
      name: 'Sara',
      availability: [1, 22],
      roles: [
        roles[1],
      ],
    ),
  );

  print('People: ${schedule.people.map((person) => person.name).toList()}');

  schedule.buildSchedule();
  print(schedule);
}
