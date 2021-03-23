import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:FAQ/scenes/questions/view/questions_view_model.dart';

class QuestionsView extends StatefulWidget {
  final _viewModel = Modular.get<DefaultQuestionViewModel>();

  @override
  _QuestionsViewState createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  @override
  void initState() {
    super.initState();
    widget._viewModel.fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        brightness: Theme.of(context).appBarTheme.brightness,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8.0))),
        title: Text('Perguntas Frequentes',
            style: Theme.of(context).textTheme.headline1),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 40),
        child: Column(children: [
          Expanded(
              flex: 10,
              child: Observer(
                builder: (_) {
                  return ListView.separated(
                    itemCount: widget._viewModel.questionList.length != null
                        ? widget._viewModel.questionList.length
                        : 0,
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return widget._viewModel.questionList.length != null
                          ? Observer(
                              builder: (_) {
                                return Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: widget._viewModel
                                                  .convertCardColor(widget
                                                      ._viewModel
                                                      .questionList[index]
                                                      .hexColor),
                                            offset: Offset(-2.0, 0.0),
                                            blurRadius: 0,
                                          ),
                                          BoxShadow(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.13),
                                              offset: Offset(0, 2.0),
                                              blurRadius: 14.0)
                                        ]),
                                    child: Center(
                                      child: ExpansionTile(
                                        childrenPadding:
                                            EdgeInsets.fromLTRB(15, 7, 15, 23),
                                        backgroundColor: Colors.transparent,
                                        title: Text(
                                          widget._viewModel.questionList[index]
                                              .title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                          textAlign: TextAlign.left,
                                        ),
                                        children: [
                                          Text(
                                            widget._viewModel
                                                .questionList[index].content,
                                          )
                                        ],
                                      ),
                                    ));
                              },
                            )
                          : Container(child: CircularProgressIndicator());
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8.3,
                      );
                    },
                  );
                },
              )),
          Spacer(),
          SizedBox(
            height: 45,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                widget._viewModel.onAddButtonPressed();
              },
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Adicionar Pergunta',
                    style: Theme.of(context).textTheme.button,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Icon(Icons.add),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
