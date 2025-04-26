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
class LoginViewRoute extends PageRouteInfo<LoginViewRouteArgs> {
  LoginViewRoute({
    Key? key,
    void Function()? onSuccess,
    List<PageRouteInfo>? children,
  }) : super(
         LoginViewRoute.name,
         args: LoginViewRouteArgs(key: key, onSuccess: onSuccess),
         initialChildren: children,
       );

  static const String name = 'LoginViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginViewRouteArgs>(
        orElse: () => const LoginViewRouteArgs(),
      );
      return LoginView(key: args.key, onSuccess: args.onSuccess);
    },
  );
}

class LoginViewRouteArgs {
  const LoginViewRouteArgs({this.key, this.onSuccess});

  final Key? key;

  final void Function()? onSuccess;

  @override
  String toString() {
    return 'LoginViewRouteArgs{key: $key, onSuccess: $onSuccess}';
  }
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
class ResetPasswordPinViewRoute
    extends PageRouteInfo<ResetPasswordPinViewRouteArgs> {
  ResetPasswordPinViewRoute({
    Key? key,
    required EmailModel emailModel,
    List<PageRouteInfo>? children,
  }) : super(
         ResetPasswordPinViewRoute.name,
         args: ResetPasswordPinViewRouteArgs(key: key, emailModel: emailModel),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordPinViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordPinViewRouteArgs>();
      return ResetPasswordPinView(key: args.key, emailModel: args.emailModel);
    },
  );
}

class ResetPasswordPinViewRouteArgs {
  const ResetPasswordPinViewRouteArgs({this.key, required this.emailModel});

  final Key? key;

  final EmailModel emailModel;

  @override
  String toString() {
    return 'ResetPasswordPinViewRouteArgs{key: $key, emailModel: $emailModel}';
  }
}

/// generated route for
/// [ResetPasswordView]
class ResetPasswordViewRoute extends PageRouteInfo<ResetPasswordViewRouteArgs> {
  ResetPasswordViewRoute({
    Key? key,
    required PinModel pinModel,
    List<PageRouteInfo>? children,
  }) : super(
         ResetPasswordViewRoute.name,
         args: ResetPasswordViewRouteArgs(key: key, pinModel: pinModel),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordViewRouteArgs>();
      return ResetPasswordView(key: args.key, pinModel: args.pinModel);
    },
  );
}

class ResetPasswordViewRouteArgs {
  const ResetPasswordViewRouteArgs({this.key, required this.pinModel});

  final Key? key;

  final PinModel pinModel;

  @override
  String toString() {
    return 'ResetPasswordViewRouteArgs{key: $key, pinModel: $pinModel}';
  }
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
