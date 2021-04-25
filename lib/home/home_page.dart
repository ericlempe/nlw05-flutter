import 'package:flutter/material.dart';
import 'package:nlw05/challenge/challenge_page.dart';
import 'package:nlw05/core/app_colors.dart';
import 'package:nlw05/home/home_controller.dart';
import 'package:nlw05/home/home_state.dart';
import 'package:nlw05/home/widgets/appbar/app_bar_widget.dart';
import 'package:nlw05/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw05/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  LevelButtonWidget(
                    label: 'Fácil',
                    color: AppColors.levelButtonFacil,
                    borderColor: AppColors.levelButtonBorderFacil,
                    fontColor: AppColors.levelButtonTextFacil,
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                    color: AppColors.levelButtonMedio,
                    borderColor: AppColors.levelButtonBorderMedio,
                    fontColor: AppColors.levelButtonTextMedio,
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                    color: AppColors.levelButtonDificil,
                    borderColor: AppColors.levelButtonBorderDificil,
                    fontColor: AppColors.levelButtonTextDificil,
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                    color: AppColors.levelButtonPerito,
                    borderColor: AppColors.levelButtonBorderPerito,
                    fontColor: AppColors.levelButtonTextPerito,
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          percent: e.questionAnswered / e.questions.length,
                          completed:
                              "${e.questionAnswered}/${e.questions.length}",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(questions: e.questions, title: e.title,),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
