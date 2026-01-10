import 'package:flutter/material.dart';

class DetailsComponent extends StatelessWidget {
  final String title;
  final String subTitel;
  final String? image;
  const DetailsComponent({
    super.key,
    required this.title,
    required this.subTitel,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.0),
          child: image != null
              ? ImageIcon(
                  AssetImage(image ?? ""),
                  size: 14,
                  color: const Color(0xFF207FA7),
                )
              : Icon(
                  Icons.sticky_note_2,
                  size: 17,
                  color: const Color(0xFF207FA7),
                ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subTitel,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.50),
                  fontSize: 14,
                  fontFamily: 'Albert Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
