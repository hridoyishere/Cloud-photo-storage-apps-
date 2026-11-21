import 'package:flutter/material.dart';
import '../models/photo_model.dart';
import '../utils/date_utils.dart';
import 'date_section_header.dart';

class PhotoGrid extends StatelessWidget {
  final List<Photo> photos;

  const PhotoGrid({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    // Group by date
    final grouped = <String, List<Photo>>{};
    for (final p in photos) {
      final key = AppDateUtils.dayKey(p.dateTaken);
      grouped.putIfAbsent(key, () => []).add(p);
    }

    // Sort keys descending
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    return CustomScrollView(
      slivers: [
        for (final key in sortedKeys) ...[
          SliverToBoxAdapter(
            child: DateSectionHeader(
              label: AppDateUtils.formatHeader(grouped[key]!.first.dateTaken),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final photo = grouped[key]![index];
                return Image.network(
                  photo.url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                );
              },
              childCount: grouped[key]!.length,
            ),
          ),
        ],
      ],
    );
  }
}