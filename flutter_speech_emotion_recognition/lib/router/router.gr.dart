// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [ChallengeHistoryView]
class ChallengeHistoryViewRoute
    extends PageRouteInfo<ChallengeHistoryViewRouteArgs> {
  ChallengeHistoryViewRoute({
    Key? key,
    required PreChallengeHistoryModel data,
    List<PageRouteInfo>? children,
  }) : super(
         ChallengeHistoryViewRoute.name,
         args: ChallengeHistoryViewRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'ChallengeHistoryViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChallengeHistoryViewRouteArgs>();
      return ChallengeHistoryView(key: args.key, data: args.data);
    },
  );
}

class ChallengeHistoryViewRouteArgs {
  const ChallengeHistoryViewRouteArgs({this.key, required this.data});

  final Key? key;

  final PreChallengeHistoryModel data;

  @override
  String toString() {
    return 'ChallengeHistoryViewRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [ChallengeView]
class ChallengeViewRoute extends PageRouteInfo<ChallengeViewRouteArgs> {
  ChallengeViewRoute({
    Key? key,
    required PreChallengeModel data,
    List<PageRouteInfo>? children,
  }) : super(
         ChallengeViewRoute.name,
         args: ChallengeViewRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'ChallengeViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChallengeViewRouteArgs>();
      return ChallengeView(key: args.key, data: args.data);
    },
  );
}

class ChallengeViewRouteArgs {
  const ChallengeViewRouteArgs({this.key, required this.data});

  final Key? key;

  final PreChallengeModel data;

  @override
  String toString() {
    return 'ChallengeViewRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [EditProfileView]
class EditProfileViewRoute extends PageRouteInfo<void> {
  const EditProfileViewRoute({List<PageRouteInfo>? children})
    : super(EditProfileViewRoute.name, initialChildren: children);

  static const String name = 'EditProfileViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditProfileView();
    },
  );
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute({List<PageRouteInfo>? children})
    : super(HomeViewRoute.name, initialChildren: children);

  static const String name = 'HomeViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginViewRoute extends PageRouteInfo<void> {
  const LoginViewRoute({List<PageRouteInfo>? children})
    : super(LoginViewRoute.name, initialChildren: children);

  static const String name = 'LoginViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [ProfileView]
class ProfileViewRoute extends PageRouteInfo<void> {
  const ProfileViewRoute({List<PageRouteInfo>? children})
    : super(ProfileViewRoute.name, initialChildren: children);

  static const String name = 'ProfileViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileView();
    },
  );
}

/// generated route for
/// [RegisterView]
class RegisterViewRoute extends PageRouteInfo<void> {
  const RegisterViewRoute({List<PageRouteInfo>? children})
    : super(RegisterViewRoute.name, initialChildren: children);

  static const String name = 'RegisterViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterView();
    },
  );
}

/// generated route for
/// [ResetPasswordMailView]
class ResetPasswordMailViewRoute extends PageRouteInfo<void> {
  const ResetPasswordMailViewRoute({List<PageRouteInfo>? children})
    : super(ResetPasswordMailViewRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordMailViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordMailView();
    },
  );
}

/// generated route for
/// [ResetPasswordPinView]
class ResetPasswordPinViewRoute extends PageRouteInfo<void> {
  const ResetPasswordPinViewRoute({List<PageRouteInfo>? children})
    : super(ResetPasswordPinViewRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordPinViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordPinView();
    },
  );
}

/// generated route for
/// [ResetPasswordView]
class ResetPasswordViewRoute extends PageRouteInfo<void> {
  const ResetPasswordViewRoute({List<PageRouteInfo>? children})
    : super(ResetPasswordViewRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordView();
    },
  );
}

/// generated route for
/// [SettingsView]
class SettingsViewRoute extends PageRouteInfo<void> {
  const SettingsViewRoute({List<PageRouteInfo>? children})
    : super(SettingsViewRoute.name, initialChildren: children);

  static const String name = 'SettingsViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsView();
    },
  );
}
