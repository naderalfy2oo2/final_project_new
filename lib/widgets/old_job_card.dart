import 'package:flutter/material.dart';

class OldJobListJobCard extends StatelessWidget {
  final String oldImageAsset;
  final String oldTitle;
  final String oldName;
  final String oldCategory;
  final String oldLocation;
  final String oldPrivacy;
  final int oldLikes;

  const OldJobListJobCard({
    Key? key,
    required this.oldImageAsset,
    required this.oldTitle,
    required this.oldName,
    required this.oldCategory,
    required this.oldLocation,
    required this.oldPrivacy,
    required this.oldLikes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                oldImageAsset,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(oldTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(oldName,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                  Row(children: [
                    const Icon(Icons.category, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(oldCategory, style: const TextStyle(fontSize: 12))
                  ]),
                  Row(children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(oldLocation, style: const TextStyle(fontSize: 12))
                  ]),
                  Row(children: [
                    const Icon(Icons.lock, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(oldPrivacy, style: const TextStyle(fontSize: 12))
                  ]),
                  Row(children: [
                    const Icon(Icons.favorite, size: 14, color: Colors.red),
                    const SizedBox(width: 4),
                    Text('Likes: $oldLikes',
                        style: const TextStyle(fontSize: 12))
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
