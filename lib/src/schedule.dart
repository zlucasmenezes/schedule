import 'person.dart';

class Schedule {
  late Map<int, Map<String, String?>> _schedule;
  late List<int> _days;

  final String _title;
  final List<Person> _people = [];
  final List<String> _roles;
  final int _month;
  final int _year;

  Schedule({
    String? title,
    List<String>? roles,
    int? month,
    int? year,
  })  : _title = title ?? 'Schedule',
        _roles = roles ?? ['Role 1', 'Role 2', 'Role 3', 'Role 4'],
        _month = month ?? DateTime.now().month,
        _year = year ?? DateTime.now().year {
    _days = _getDays(month: _month, year: _year);
    _schedule = {
      for (var day in _days)
        day: {
          for (var role in _roles) role: null,
        },
    };
  }

  String get title => _title;
  List<Person> get people => _people;
  List<int> get days => _days;
  int get month => _month;
  int get year => _year;
  List<String> get roles => _roles;

  addPerson(Person? person) {
    if (person == null) {
      print('Person can not be null');
      return;
    }

    if (!person.availability.every((day) => _days.contains(day))) {
      print('Not all of available days of ${person.name} are on the schedule');
      person.availability =
          person.availability.where((day) => _days.contains(day)).toList();
    }

    int index = _people
        .indexWhere((p) => p.name.toLowerCase() == person.name.toLowerCase());
    if (index >= 0) {
      print('${person.name} has already been added. Updating available days.');
      _people[index].availability = person.availability;
      return;
    }

    _people.add(person);
  }

  Map<int, Map<String, String?>> buildSchedule() {
    for (var k = 0; k <= 100; k++) {
      for (var i = 1; i <= _days.length; i++) {
        List<Person> availablePeople =
            _people.where((p) => p.availability.length == i).toList();

        for (var person in availablePeople) {
          for (var j = 0; j < i; j++) {
            Map<String, String?> daySchedule = {
              ..._schedule[person.availability[j]]!
            };

            if (daySchedule.values.whereType<String>().length < _roles.length) {
              if (!daySchedule.containsValue(person.name)) {
                for (var role in _roles) {
                  if (daySchedule[role] == null) {
                    daySchedule[role] = person.name;
                    break;
                  }
                }

                _schedule[person.availability[j]] = daySchedule;
                break;
              }
            }
          }
        }
      }
    }

    return _schedule;
  }

  @override
  String toString() {
    var buffer = StringBuffer();

    buffer.write(
      '$_title - ${_month.toString().padLeft(2, '0')}/$_year\n===\n',
    );

    for (var day in _days) {
      Map<String, String?> includedOnes = _schedule[day]!;

      buffer.write(
        '\n${day.toString().padLeft(2, '0')}/${_month.toString().padLeft(2, '0')}\n',
      );

      for (var i = 0; i < _roles.length; i++) {
        buffer.write(
          '- ${_roles[i]}: ${includedOnes[_roles[i]] ?? ""}\n',
        );
      }
    }

    return buffer.toString();
  }

  List<int> _getDays({required int month, required int year}) {
    return [for (var i = 0; i < DateTime(year, month + 1, 0).day; i++) i]
        .where((day) => DateTime(year, month, day).weekday == DateTime.sunday)
        .toList();
  }
}
