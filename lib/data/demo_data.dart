import '../models/photo_model.dart';

class DemoData {
  static final List<Photo> photos = [
    Photo(
      id: '1',
      url: 'https://picsum.photos/id/1015/600/600',
      dateTaken: DateTime.now(),
      title: 'Mountain View',
    ),
    Photo(
      id: '2',
      url: 'https://picsum.photos/id/1016/600/600',
      dateTaken: DateTime.now(),
      title: 'Forest Trail',
    ),
    Photo(
      id: '3',
      url: 'https://picsum.photos/id/1018/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 1)),
      title: 'Lake Sunset',
    ),
    Photo(
      id: '4',
      url: 'https://picsum.photos/id/1019/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 1)),
      title: 'Snowy Peak',
    ),
    Photo(
      id: '5',
      url: 'https://picsum.photos/id/1020/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 1)),
      title: 'Bear Walk',
    ),
    Photo(
      id: '6',
      url: 'https://picsum.photos/id/1024/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 3)),
      title: 'Eagle',
    ),
    Photo(
      id: '7',
      url: 'https://picsum.photos/id/1025/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 3)),
      title: 'Pug Dog',
    ),
    Photo(
      id: '8',
      url: 'https://picsum.photos/id/1035/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 7)),
      title: 'Waterfall',
    ),
    Photo(
      id: '9',
      url: 'https://picsum.photos/id/1039/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 7)),
      title: 'River',
    ),
    Photo(
      id: '10',
      url: 'https://picsum.photos/id/1043/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 15)),
      title: 'Bridge',
    ),
    Photo(
      id: '11',
      url: 'https://picsum.photos/id/1044/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 15)),
      title: 'Road',
    ),
    Photo(
      id: '12',
      url: 'https://picsum.photos/id/1050/600/600',
      dateTaken: DateTime.now().subtract(const Duration(days: 30)),
      title: 'Canyon',
    ),
  ];
}