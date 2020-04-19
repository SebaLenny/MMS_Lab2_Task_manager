import 'package:flutter/material.dart';

import 'Utility/dimens.dart';

class TaskDetailsRow extends StatelessWidget {
  final String headline;
  final String content;
  final IconData icon;

  TaskDetailsRow(this.headline, this.content, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Icon(
              icon,
              color: Colors.grey,
            ),
            margin: EdgeInsets.only(right: Dimens.standardDistance),
          ),
          flex: 2,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  headline,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              Container(
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                margin: EdgeInsets.only(top: Dimens.smallDistance),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          flex: 10,
        ),
      ],
    );
  }
}
