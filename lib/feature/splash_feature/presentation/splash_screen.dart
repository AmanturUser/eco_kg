import 'package:eco_kg/core/auto_route/auto_route.dart';
import 'package:eco_kg/feature/splash_feature/presentation/bloc/language_bloc.dart';
import 'package:eco_kg/feature/splash_feature/presentation/widget/button_with_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco_kg/core/utils/utils.dart';
import 'package:eco_kg/feature/splash_feature/domain/entity/language.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 252),
            Image.asset('assets/img/logo.png', height: 280, width: 280),
            const SizedBox(height: 198),
            InkWell(
              onTap: () async{
                var items=Language.languageList();
                await showModalBottomSheet(
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1)
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for(var i=0;i<items.length;i++)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(items[i].name),
                                  leading: Text(items[i].flag),
                                  onTap: (){
                                    BlocProvider.of<LanguageBloc>(context).add(SelectLanguageEvent(lanCode: items[i].languageCode));
                                    Navigator.pop(context);
                                    AutoRouter.of(context).replace(const HomeRoute());
                                  },
                                ),
                              ),
                              const Divider(color: Colors.black,height: 1,)
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                );

              },
              child: buttonWithIcon(context.text.select_language, 'global.png'),
            )
          ],
        ),
      ),
    );
  }
}
