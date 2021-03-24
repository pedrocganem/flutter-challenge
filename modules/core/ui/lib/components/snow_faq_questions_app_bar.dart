import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SnowQuestionAppBar extends StatelessWidget {
  final bool isSearchBarEnabled;
  final Function() onPressed;
  final Function() onStartTyping;
  final Function(String) onChanged;
  const SnowQuestionAppBar(
      {this.isSearchBarEnabled,
      this.onPressed,
      this.onStartTyping,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return isSearchBarEnabled
        ? AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8.0))),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.5),
                  color: Color(0xFF0F137A),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.search,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                    Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.overline,
                        onChanged: onChanged,
                        decoration: InputDecoration(
                          hintText: 'Pesquisar pergunta',
                          hintStyle: Theme.of(context).textTheme.subtitle1,
                          contentPadding: EdgeInsets.only(bottom: 12),
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      child: VerticalDivider(
                        indent: 8,
                        endIndent: 8,
                        width: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: 24,
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.close,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : AppBar(
            actions: [
              Observer(builder: (_) {
                return IconButton(
                  onPressed: onPressed,
                  splashRadius: 8,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Icon(Icons.search),
                  ),
                );
              }),
            ],
            automaticallyImplyLeading: false,
            centerTitle: true,
            brightness: Theme.of(context).appBarTheme.brightness,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8.0))),
            title: Text('Perguntas Frequentes',
                style: Theme.of(context).textTheme.headline1),
          );
  }
}
