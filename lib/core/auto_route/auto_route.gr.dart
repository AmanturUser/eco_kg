part of 'auto_route.dart';


abstract class _$AppRouter extends RootStackRouter{
  @override
  final Map<String, PageFactory> pagesMap={
    SplashRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const SplashScreen()
      );
    },
    SignInRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const SignInScreen()
      );
    },
    SignUpRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const SignUpScreen()
      );
    },
    ForgotPasswordRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const ForgotPaswordScreen()
      );
    },
    VerificationRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const VerificationScreen()
      );
    },
    NewPasswordRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const NewPaswordScreen()
      );
    },
    SuccessRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const SuccessScreen()
      );
    },
    HomeRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const HomeScreen()
      );
    },
    LibraryRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: LibraryScreen()
      );
    },
    ScreenTestRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const MainTestScreen()
      );
    },
    StartTestRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const TestsScreen()
      );
    },
    FinishTestRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const FinishScreen()
      );
    },
    ResultTestRoute.name: (routeData){
      return AutoRoutePage<dynamic>(
          routeData: routeData,
          child: ResultScreen()
      );
    },
  };
}

class SplashRoute extends PageRouteInfo<void>{
  static const String name='Splash';
  static const PageInfo<void> page=PageInfo<void>(name);
  const SplashRoute({List<PageRouteInfo>? children}): super(SplashRoute.name,initialChildren: children);
}

class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
    SignInRoute.name,
    initialChildren: children,
  );
  static const String name = 'SignInRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
    SignUpRoute.name,
    initialChildren: children,
  );
  static const String name = 'SignUpRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
    ForgotPasswordRoute.name,
    initialChildren: children,
  );
  static const String name = 'ForgotPasswordRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class VerificationRoute extends PageRouteInfo<void> {
  const VerificationRoute({List<PageRouteInfo>? children})
      : super(
    VerificationRoute.name,
    initialChildren: children,
  );
  static const String name = 'VerificationRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class NewPasswordRoute extends PageRouteInfo<void> {
  const NewPasswordRoute({List<PageRouteInfo>? children})
      : super(
    NewPasswordRoute.name,
    initialChildren: children,
  );
  static const String name = 'NewPasswordRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
      : super(
    SuccessRoute.name,
    initialChildren: children,
  );
  static const String name = 'SuccessRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
    HomeRoute.name,
    initialChildren: children,
  );
  static const String name = 'HomeRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class LibraryRoute extends PageRouteInfo<void> {
  const LibraryRoute({List<PageRouteInfo>? children})
      : super(
    LibraryRoute.name,
    initialChildren: children,
  );
  static const String name = 'LibraryRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class StartTestRoute extends PageRouteInfo<void> {
  const StartTestRoute({List<PageRouteInfo>? children})
      : super(
    StartTestRoute.name,
    initialChildren: children,
  );
  static const String name = 'StartTestRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class ScreenTestRoute extends PageRouteInfo<void> {
  const ScreenTestRoute({List<PageRouteInfo>? children})
      : super(
    ScreenTestRoute.name,
    initialChildren: children,
  );
  static const String name = 'ScreenTestRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class FinishTestRoute extends PageRouteInfo<void> {
  const FinishTestRoute({List<PageRouteInfo>? children})
      : super(
    FinishTestRoute.name,
    initialChildren: children,
  );
  static const String name = 'FinishTestRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class ResultTestRoute extends PageRouteInfo<void> {
  const ResultTestRoute({List<PageRouteInfo>? children})
      : super(
    ResultTestRoute.name,
    initialChildren: children,
  );
  static const String name = 'ResultTestRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}
