import 'package:FAQ/scenes/add_question/data/repositories/add_question_repository.dart';
import 'package:FAQ/scenes/add_question/data/service/add_question_service.dart';
import 'package:FAQ/scenes/add_question/domain/use_cases/add_question_use_case.dart';
import 'package:FAQ/scenes/questions/data/repositories/questions_repository.dart';
import 'package:FAQ/scenes/questions/data/services/questions_service.dart';
import 'package:FAQ/scenes/questions/domain/fetch_question_use_case.dart';
import 'package:FAQ/scenes/questions/view/questions_view.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:FAQ/scenes/questions/view/questions_view_model.dart';
import 'package:foundation/constants/routes.dart';

class FAQModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Question List scene
        Bind<QuestionService>((_) => LocalQuestionsService(), singleton: false),
        Bind<QuestionRepository>((_) => DefaultQuestionRepository(),
            singleton: false),
        Bind<FetchQuestionsUseCase>((_) => DefaultFetchQuestionsUseCase(),
            singleton: false),
        Bind((_) => DefaultQuestionViewModel(),
            singleton: false),

        //Add question scene
        // Bind<AddQuestionService>((_) => DefaultAddQuestionService(),
        //     singleton: false),
        // Bind<AddQuestionRepository>((_) => DefaultAddQuestionRepository(),
        //     singleton: false),
        // Bind<AddQuestionUseCase>((_) => DefaultAddQuestionUseCase(),
        //     singleton: false)
        //TODO bind ViewModel
      ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter(AppRoutes.ROUTE_QUESTIONS_VIEW,
            child: (_, args) => QuestionsView())
      ];
}
