import 'package:eco_kg/core/style/app_colors.dart';
import 'package:eco_kg/feature/library_feature/domain/entities/library_entity.dart';
import 'package:eco_kg/feature/library_feature/presentation/filter/filter.dart';
import 'package:eco_kg/feature/splash_feature/domain/entity/language.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth_feature/presentation/widgets/appBarLeadintBack.dart';
import '../../../splash_feature/presentation/bloc/language_bloc.dart';
import 'bloc/library_bloc.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<LibraryBloc>()..add(GetLibraryEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Библиотека'),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: appBarLeading(context)
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const FilterScreen()));
          }, icon: const Icon(Icons.filter_alt))
        ],
        leadingWidth: 100,
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
  builder: (context, stateLan) {
    return BlocBuilder<LibraryBloc, LibraryState>(
        bloc: productBloc,
        builder: (context, state) {
          if (state is LoadingLibraryState) {
            return Center(child: progressWidget());
          }
          if (state is LoadedLibraryState) {
            var library = state.library!.dataProvider;
            var lan='';
            if(stateLan.lanCode!='ru') {
              lan=stateLan.lanCode;
            }

            print(lan);

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: library.length,
                itemBuilder: (_, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.network(library[index].picture!,loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: progressWidget(),
                            );
                          },),
                        ),
                        Text(lan=='' ? library[index].title! : lan=='en' ? library[index].titleEn! : library[index].titleKy!),
                      ],
                    ),

                  );
                });
          }
          if(state is ErrorLibraryState){
            print(state.error);
            return Center(child: Text(state.error.toString()),);
          }
          return Container();
        },
      );
  },
),
    );
  }
}
