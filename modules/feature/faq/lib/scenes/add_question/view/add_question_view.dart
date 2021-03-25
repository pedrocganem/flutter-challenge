import 'package:FAQ/scenes/add_question/view/add_question_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ui/ui.dart';

class AddQuestionView extends StatefulWidget {
  final _viewModel = Modular.get<AbstractAddQuestionViewModel>();

  @override
  _AddQuestionViewState createState() => _AddQuestionViewState();
}

class _AddQuestionViewState extends State<AddQuestionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnowFAQAppBar(title: 'Adicionar Pergunta').appBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.13),
                    offset: Offset(0, 2.0),
                    blurRadius: 14.0),
              ]),
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: SnowFAQTextFormField(widget._viewModel.onTitleChange, 1,
                        'Título da Pergunta', true)
                    .textFormField(context),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SnowFAQTextFormField(
                        widget._viewModel.onContentChange, 4, 'Resposta', false)
                    .textFormField(context),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Cor',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 40,
                    child: Observer(builder: (_) {
                      return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                widget._viewModel.onColorChosen(index);
                              },
                              child: Observer(builder: (_) {
                                return SnowFAQCircleColorCell(
                                    color:
                                        widget._viewModel.colorAtIndex(index),
                                    isSelected: widget._viewModel
                                        .isColorSelected(index));
                              }),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 20,
                            );
                          },
                          itemCount: widget._viewModel.hexColorList.length);
                    }),
                  ),
                ],
              ),

              Spacer(),
              Container(
                  height: 45,
                  child: Observer(builder: (_) {
                    return RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6))),
                        onPressed: widget._viewModel.isButtonEnabled
                            ? widget._viewModel.onAddButtonPressed
                            : null,
                        child: Row(children: [
                          Spacer(),
                          Text('Adicionar',
                              style: widget._viewModel.isButtonEnabled
                                  ? Theme.of(context).textTheme.button
                                  : Theme.of(context).textTheme.headline2),
                          Spacer()
                        ]));
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
