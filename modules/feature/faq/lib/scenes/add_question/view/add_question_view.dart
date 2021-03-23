import 'package:FAQ/scenes/add_question/view/add_question_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ui/ui.dart';

class AddQuestionView extends StatefulWidget {
  final _viewModel = Modular.get<AddQuestionViewModel>();

  @override
  _AddQuestionViewState createState() => _AddQuestionViewState();
}

class _AddQuestionViewState extends State<AddQuestionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnowFAQAppBar().appBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(7), boxShadow: [
            BoxShadow(
                color: Color(0xFF000000).withOpacity(0.13),
                offset: Offset(0, 2.0),
                blurRadius: 14.0),
          ]),
          child: Column(
            children: [
              Spacer(),
              SnowFAQTextFormField(
                      widget._viewModel.onTitleChange, 1, 'Título da Pergunta')
                  .textFormField(context),
              Spacer(),
              SnowFAQTextFormField(
                      widget._viewModel.onContentChange, 4, 'Resposta')
                  .textFormField(context),
              Spacer(),
              //TODO create a custom selector for colors
            ],
          ),
        ),
      ),
    );
  }
}
