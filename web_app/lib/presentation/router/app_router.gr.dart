// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddConnectionRoute.name: (routeData) {
      final args = routeData.argsAs<AddConnectionRouteArgs>(
          orElse: () => const AddConnectionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddConnectionPage(key: args.key),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [AddConnectionPage]
class AddConnectionRoute extends PageRouteInfo<AddConnectionRouteArgs> {
  AddConnectionRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddConnectionRoute.name,
          args: AddConnectionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddConnectionRoute';

  static const PageInfo<AddConnectionRouteArgs> page =
      PageInfo<AddConnectionRouteArgs>(name);
}

class AddConnectionRouteArgs {
  const AddConnectionRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddConnectionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<MainRouteArgs> page = PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}
