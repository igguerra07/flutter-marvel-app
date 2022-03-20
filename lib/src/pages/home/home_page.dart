import 'package:flutter/material.dart';
import 'package:marvel_app/resources/colors.dart';
import 'package:marvel_app/resources/icons.dart';
import 'package:marvel_app/resources/images.dart';
import 'package:marvel_app/resources/strings.dart';
import 'package:marvel_app/src/datasources/remote/characters_remote_data.dart';
import 'package:marvel_app/src/datasources/remote/characters_remote_data_impl.dart';
import 'package:marvel_app/src/pages/home/home_change_notifier.dart';
import 'package:marvel_app/src/pages/home/home_page_state.dart';
import 'package:marvel_app/services/marvel_service.dart';
import 'package:marvel_app/src/pages/home/widgets/characters_list.dart';
import 'package:marvel_app/src/pages/home/widgets/characters_section.dart';
import 'package:marvel_app/src/pages/home/widgets/characters_section_header.dart';
import 'package:marvel_app/src/pages/home/widgets/home_header.dart';
import 'package:marvel_app/src/pages/home/widgets/marvel_app_bar.dart';
import 'package:marvel_app/src/repositories/characters_repository.dart';
import 'package:marvel_app/src/repositories/characters_repository_impl.dart';
import 'package:marvel_app/src/usescases/get_characters.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = http.Client();

    final marvelService = MarvelService(client: client);

    final charactersRemoteDataSource = CharactersRemoteDataSourceImpl(
      marvelService: marvelService,
    );

    final charactersRepository = CharacteresRepostioryImpl(
      charactersRemoteDataSource: charactersRemoteDataSource,
    );

    final getCharacters = GetCharacters(
      charactersRepository: charactersRepository,
    );

    final charactersNotifier = CharactersChangeNotifier(
      getCharacters: getCharacters,
    );

    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => charactersNotifier..getCharacters(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MarvelAppBar(),
              const SizedBox(height: 24),
              const HomeHeader(),
              const SizedBox(height: 16),
              Consumer<CharactersChangeNotifier>(
                builder: (_, value, __) {
                  final currentState = value.state;
                  if (currentState is HomeLoadingState) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorResource.red,
                        ),
                      ),
                    );
                  }
                  if (currentState is HomeFailureState) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          currentState.error.toString(),
                        ),
                      ),
                    );
                  }
                  if (currentState is HomeSuccessState) {
                    final characters = currentState.characters;
                    return Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: deviceHeight * .4,
                              child: CharactersSection(
                                sectionText: StringResource.heros,
                                characters: characters,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: deviceHeight * .4,
                              child: CharactersSection(
                                sectionText: StringResource.antihero,
                                characters: characters,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: deviceHeight * .4,
                              child: CharactersSection(
                                sectionText: StringResource.villians,
                                characters: characters,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
