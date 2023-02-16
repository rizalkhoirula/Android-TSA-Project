class ChartModel {
  final String name;
  final String message;
  final String time;
  final String profileUrl;

  ChartModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.profileUrl});
}

final List<ChartModel> items = [
  ChartModel(
      name: 'Bjorka',
      message: 'broo, this time to hack ur country',
      time: '23.15',
      profileUrl: 'assets/images/bjorka.png'),
];
