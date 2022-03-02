class Schedule {
  late Map<int, List<String>> _schedule;
  late List<int> _days;

  final List<String> _roles;
  final int _month;
  final int _year;

  Schedule({
    List<String> roles = const ['Role 1', 'Role 2', 'Role 3', 'Role 4'],
    int? month,
    int? year,
  })  : _roles = roles,
        _month = month ?? DateTime.now().month,
        _year = year ?? DateTime.now().year {
    _days = _getDays(month: _month, year: _year);
    _schedule = {for (var day in _days) day: []};
  }

  List<int> get days => _days;
  int get month => _month;
  int get year => _year;
  List<String> get roles => _roles;

  List<int> _getDays({required int month, required int year}) {
    return [for (var i = 0; i < DateTime(year, month + 1, 0).day; i++) i]
        .where((day) => DateTime(year, month, day).weekday == DateTime.sunday)
        .toList();
  }
}
