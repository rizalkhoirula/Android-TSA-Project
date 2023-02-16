class ChartModel {
  final String name;
  final String message;
  // final String time;
  final String profileUrl;

  ChartModel(
      {required this.name,
      required this.message,
      // required this.time,
      required this.profileUrl});
}

final List<ChartModel> items = [
  ChartModel(
      name: 'Status Saya',
      message: 'Tidak Ada Status',
      // time: '23.15',
      profileUrl: 'assets/images/bjorka.png'),
  ChartModel(
      name: 'Bjorka',
      message: '23.15',
      // time: '23.15',
      profileUrl: 'assets/images/bjorka.png'),
  ChartModel(
      name: 'Daffa',
      message: '13.45',
      // time: '23.15',
      profileUrl: 'assets/images/bjorka.png'),
];
