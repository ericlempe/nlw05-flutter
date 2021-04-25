import 'package:flutter/material.dart';
import 'package:nlw05/core/app_text_styles.dart';
import 'package:nlw05/shared/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentpage;
  final int totalpage;

  QuestionIndicatorWidget({required this.currentpage,  required this.totalpage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Questão $currentpage', style: AppTextStyles.body,),
              Text('de $totalpage', style: AppTextStyles.body,),
            ],
          ),
          SizedBox(height: 16,),
          ProgressIndicatorWidget(value: currentpage / totalpage)
        ],
      ),
    );
  }
}
