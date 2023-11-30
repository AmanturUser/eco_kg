import 'package:eco_kg/core/style/app_text_styles.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/splash_feature/domain/entity/language.dart';
import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../splash_feature/presentation/bloc/language_bloc.dart';
import '../../domain/entities/param_entity.dart';
import 'bloc/filter_bloc.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final paramBloc = context.read<FilterBloc>();
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<LanguageBloc, LanguageState>(builder: (context,stateLan){
        return BlocBuilder<FilterBloc, FilterState>(
          bloc: paramBloc..add(GetParamEvent(lanCode: stateLan.lanCode)),
          builder: (context, state) {
            if (state is LoadingFilterState) {
              return Center(child: progressWidget());
            }
            if (state is LoadedFilterState) {
              final ParamEntity param = state.param;
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
                children: [
                  Text(context.text.type,style: AppTextStyles.clearSansMediumTextStyle18),
                  Column(
                      children:
                      param.type.entries.map((e) => CheckboxListTile(value: false, onChanged: (value){},title: Text(e.value),)).toList()
                  ),
                  Text(context.text.category,style: AppTextStyles.clearSansMediumTextStyle18),
                  Column(
                    children:
                      param.category.entries.map((e) => CheckboxListTile(value: false, onChanged: (value){},title: Text(e.value),)).toList()
                  ),
                  Text(context.text.tags,style: AppTextStyles.clearSansMediumTextStyle18),
                  Column(
                      children:
                      param.tags.entries.map((e) => CheckboxListTile(value: false, onChanged: (value){},title: Text(e.value),)).toList()
                  ),
                  Text(context.text.theme,style: AppTextStyles.clearSansMediumTextStyle18),
                  Column(
                      children:
                      param.theme.entries.map((e) => CheckboxListTile(value: false, onChanged: (value){},title: Text(e.value),)).toList()
                  ),
                ],
              );
            }
            if(state is ErrorFilterState){
              print(state.error);
              return Center(child: Text(state.error.toString()));
            }
            return Container();
          },
        );
      }),
    );
  }
}
