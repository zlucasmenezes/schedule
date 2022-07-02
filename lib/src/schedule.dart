import 'person.dart';

class Schedule {
  late Map<int, Map<String, String?>> _schedule;
  late List<int> _days;

  final String _title;
  final List<Person> _people = [];
  final List<String> _roles;
  final int _month;
  final int _year;
  final int _repeat;

  Schedule({
    String? title,
    List<String>? roles,
    int? month,
    int? year,
    int? repeat,
  })  : _title = title ?? 'Schedule',
        _roles = roles ?? ['Role 1', 'Role 2', 'Role 3', 'Role 4'],
        _month = month ?? DateTime.now().month,
        _year = year ?? DateTime.now().year,
        _repeat = repeat ?? 1 {
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
  int get repeat => _repeat;
  List<String> get roles => _roles;

  addPerson({
    required name,
    List<int>? availability,
    List<String>? roles,
  }) {
    if (name == null) {
      print('name can not be null');
      return;
    }

    Person person = Person(
      name: name,
      availability: availability ?? _days,
      roles: roles ?? _roles,
    );

    if (!person.availability.every((day) => _days.contains(day))) {
      print('Not all of available days of ${person.name} are on the schedule');
      person.availability =
          person.availability.where((day) => _days.contains(day)).toList();
    }

    if (!person.roles.every((role) => _roles.contains(role))) {
      print('Not all of roles of ${person.name} are on the schedule');
      person.roles =
          person.roles.where((role) => _roles.contains(role)).toList();
    }

    int index = _people
        .indexWhere((p) => p.name.toLowerCase() == person.name.toLowerCase());
    if (index >= 0) {
      print(
          '${person.name} has already been added. Updating available days and roles.');
      _people[index].availability = person.availability;
      _people[index].roles = person.roles;
      return;
    }

    _people.add(person);
  }

  Map<int, Map<String, String?>> buildSchedule() {
    var people = _people;
    people.sort(((a, b) => (a.roles.length + a.availability.length)
        .compareTo(b.roles.length + b.availability.length)));

    for (var i = 0; i < repeat; i++) {
      if (i > 0) {
        people.shuffle();
      }
      personLoop:
      for (var person in people) {
        roleLoop:
        for (var role in person.roles) {
          for (var day in person.availability) {
            Map<String, String?> daySchedule = {..._schedule[day]!};

            if (daySchedule.values.whereType<String>().length < _roles.length) {
              var repeat = 0;
              for (var schedule in _schedule.values) {
                if (schedule.containsValue(person.name)) {
                  repeat++;
                  if (repeat >= _repeat) {
                    break personLoop;
                  }
                }
              }

              if (!daySchedule.containsValue(person.name)) {
                if (daySchedule[role] == null && person.roles.contains(role)) {
                  daySchedule[role] = person.name;
                  _schedule[day] = daySchedule;
                  break roleLoop;
                }
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
    return [for (var i = 1; i <= DateTime(year, month + 1, 0).day; i++) i]
        .where((day) => DateTime(year, month, day).weekday == DateTime.sunday)
        .toList();
  }
}
