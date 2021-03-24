import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:FAQ/scenes/questions/view/questions_view_model.dart';
import 'package:ui/components/snow_faq_questions_app_bar.dart';

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
    return Observer(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: SnowQuestionAppBar(
              onChanged: widget._viewModel.onInputSearchKeyword,
              isSearchBarEnabled: widget._viewModel.isSearchBarEnabled,
              onPressed: () {
                widget._viewModel.toggleSearchBar();
                print(widget._viewModel.isSearchBarEnabled);
              }).build(context),
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
                                        child: Container(
                                          child: ExpansionTile(
                                            childrenPadding:
                                                EdgeInsets.fromLTRB(
                                                    15, 7, 15, 23),
                                            backgroundColor: Colors.transparent,
                                            title: Text(
                                              widget._viewModel
                                                  .questionList[index].title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
                                              textAlign: TextAlign.left,
                                            ),
                                            children: [
                                              Text(
                                                widget
                                                    ._viewModel
                                                    .questionList[index]
                                                    .content,
                                                textAlign: TextAlign.left,
                                              ),
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
                child: Builder(builder: (BuildContext context) {
                  return RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      widget._viewModel
                          .onAddButtonPressed(Scaffold.of(context));
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
                        Icon(Icons.add, color: Theme.of(context).accentColor),
                      ],
                    ),
                  );
                }),
              ),
            ]),
          ),
        );
      },
    );
  }
}
