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
    CommandRoute.name: (routeData) {
      final args = routeData.argsAs<CommandRouteArgs>(
          orElse: () => const CommandRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommandPage(key: args.key),
      );
    },
    DashboardRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => DashboardRouteArgs(
                  apiKey: queryParams.getString(
                'apiKey',
                '',
              )));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardPage(
          key: args.key,
          apiKey: args.apiKey,
        ),
      );
    },
    EditConnectionRoute.name: (routeData) {
      final args = routeData.argsAs<EditConnectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditConnectionPage(
          key: args.key,
          connection: args.connection,
        ),
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
/// [CommandPage]
class CommandRoute extends PageRouteInfo<CommandRouteArgs> {
  CommandRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CommandRoute.name,
          args: CommandRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CommandRoute';

  static const PageInfo<CommandRouteArgs> page =
      PageInfo<CommandRouteArgs>(name);
}

class CommandRouteArgs {
  const CommandRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CommandRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    Key? key,
    String apiKey = '',
    List<PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(
            key: key,
            apiKey: apiKey,
          ),
          rawQueryParams: {'apiKey': apiKey},
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<DashboardRouteArgs> page =
      PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    this.key,
    this.apiKey = '',
  });

  final Key? key;

  final String apiKey;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, apiKey: $apiKey}';
  }
}

/// generated route for
/// [EditConnectionPage]
class EditConnectionRoute extends PageRouteInfo<EditConnectionRouteArgs> {
  EditConnectionRoute({
    Key? key,
    required Connection connection,
    List<PageRouteInfo>? children,
  }) : super(
          EditConnectionRoute.name,
          args: EditConnectionRouteArgs(
            key: key,
            connection: connection,
          ),
          initialChildren: children,
        );

  static const String name = 'EditConnectionRoute';

  static const PageInfo<EditConnectionRouteArgs> page =
      PageInfo<EditConnectionRouteArgs>(name);
}

class EditConnectionRouteArgs {
  const EditConnectionRouteArgs({
    this.key,
    required this.connection,
  });

  final Key? key;

  final Connection connection;

  @override
  String toString() {
    return 'EditConnectionRouteArgs{key: $key, connection: $connection}';
  }
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
