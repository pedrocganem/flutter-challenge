import 'package:flutter_modular/flutter_modular.dart';
import '../../data/repositories/splash_screen_repository.dart';
import 'package:models/models.dart';

abstract class CreateDefaultQuestionsIfNeededUseCase {
  execute();
}

class DefaultCreateDefaultQuestionsIfNeededUseCase
    implements CreateDefaultQuestionsIfNeededUseCase {
  final _repository = Modular.get<SplashScreenRepository>();

  @override
  execute() async {
    final isFirstLaunch = await _repository.isFirstLaunch();
    if (!isFirstLaunch) return;
    await _repository.setFirstLaunch();
    final defaultQuestions = [
      QuestionModel(
          title: 'Em qual data foi fundada a Snowman Labs?',
          content: 'A Snowman Labs foi fundada no dia 9 de agosto de 2012.',
          hexColor: "FF46C9A7"),
      QuestionModel(
          title: 'Qual foi o primeiro cliente/ projeto que a Snow teve?',
          content:
              'O primeiro cliente que a Snow teve foi um candidato a deputado federal e fizemos o projeto dos santinhos digitais. Foi entregue em setembro de 2012.',
          hexColor: "FFFF7074"),
      QuestionModel(
          title: 'Por que foi escolhido o nome Snowman Labs? ',
          content:
              'Por conta da neve em Curitiba que ocorreu em 2013. Queríamos um mascote e a partir dele, surgiu o nome (foi a primeira coisa que pensamos na época). ',
          hexColor: "FFFFBE00"),
      QuestionModel(
          title:
              'Quantos funcionários a Snow tinha no primeiro ano de existência?',
          content: 'Em nosso primeiro ano éramos apenas 7 funcionários.',
          hexColor: "FF10159A"),
      QuestionModel(
          title: 'Qual é o propósito da Snowman Labs?',
          content: 'Servir e impactar pessoas através de tecnologia e design.',
          hexColor: "FF46C9A7"),
      QuestionModel(
          title: 'Qual é a missão da Snowman Labs?',
          content:
              'Criar soluções que promovam a transformação e evolução digital dos nossos clientes, gerando negócios, resultados e impactando positivamente pessoas e processos.',
          hexColor: "FFFF7074"),
      QuestionModel(
          title: 'Qual é a visão da Snowman Labs?',
          content:
              'Ampliar exponencialmente o potencial das empresas e das pessoas através de design e tecnologia.',
          hexColor: "FFFFBE00"),
      QuestionModel(
          title: 'Quais são os princípios e valores da Snowman Labs?',
          content:
              'Fé - que guia as nossas ações\nQualidade - que nos move sempre a darmos o nosso melhor\nTransparência - que constrói a confiança\nRespeito - que honra as pessoas\nRelacionamento - que nos torna uma família\nComprometimento - que nos faz andar mais uma milha\nImpacto - que cria esperança',
          hexColor: "FF10159A"),
      QuestionModel(
          title: 'Quais stacks são utilizadas na Snowman Labs?',
          content:
              'A Snow trabalha com diferentes stacks e tecnologias, entre elas estão Java/Kotlin para Android nativo, Swift para iOS, Flutter/Dart, Python, .NET, VueJS, NodeJS…',
          hexColor: "FF46C9A7"),
      QuestionModel(
          title: 'A Snow é aberta à novas idéias e tecnologias?',
          content:
              'Sim! A Snow está sempre buscando se manter atualizada sobre novas tecnologias e sempre está aberta à novas ideias e sugestões. Fomos umas das primeiras em Curitiba a adotar o Flutter para projetos em produção e estamos sempre buscando por inovações e melhorias.',
          hexColor: "FFFF7074"),
    ];
    defaultQuestions.forEach((element)  {
       _repository.createQuestion(element);
    });
  }
}
