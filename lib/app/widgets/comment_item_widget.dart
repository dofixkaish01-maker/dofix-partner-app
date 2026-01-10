import 'package:flutter/material.dart';

class CommentItemWidget extends StatelessWidget {
  final String userName;
  final String date;
  final String comment;
  final String imageUrl;
  final String? rating;

  const CommentItemWidget({
    super.key,
    required this.userName,
    required this.date,
    required this.comment,
    required this.imageUrl,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: imageUrl.contains('default.png')
                        ? NetworkImage(
                            "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg")
                        : NetworkImage(imageUrl),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Visibility(
                            visible: (rating != null),
                            child: SizedBox(width: 6)),
                        Visibility(
                            visible: (rating != null),
                            child: Icon(Icons.star,
                                color: Colors.blueAccent, size: 14)),
                        Visibility(
                          visible: (rating != null),
                          child: Text(
                            rating ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Text(
                comment,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 0.5),
      ],
    );
  }
}
