part of 'pages.dart';

class WrapperUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> init() async {
      SharedPreferences storagePref = await SharedPreferences.getInstance();
      try {
        if (storagePref.getString('token') != null) {
          print('masuk token');
          Users.token = storagePref.getString('token');
          await context.read<UsersCubit>().getUser();
          return true;
        } else {
          context.read<UsersCubit>().toUserLoaded();
          return false;
        }
      } catch (e) {
        print(e.toString());
        return false;
      }
    }

    return FutureBuilder(
      future: init(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return BlocBuilder<UsersCubit, UsersState>(
            builder: (_, userState) {
              if (userState is UsersLoaded) {
                if (userState.user != null) {
                  if (userState.user.roles == 'mahasiswa') {
                    context.read<EventCubit>().getListEvent(userState.user.id);
                    context.read<CategoryCubit>().getListCategory();
                    context
                        .read<JoineventCubit>()
                        .getMyJoinEvent(userState.user.id);
                    return FutureBuilder(
                        future: subscribeNotification('mahasiswa', 'admin'),
                        builder: (_, __) => MahasiswaMainPage());
                  } else if (userState.user.roles == 'admin') {
                    context.read<EventCubit>().getListEvent(userState.user.id);
                    context.read<CategoryCubit>().getListCategory();
                    context.read<JoineventCubit>().getAllJoinEvent();
                    // context.read<UsersCubit>().getAllUser();
                    // context.read<UsersCubit>().getAllUser();
                    return HomeAdminPage();
                  } else {
                    print('Masuk 1');
                    return LoginPage();
                  }
                } else {
                  print('Masuk 2');
                  return LoginPage();
                }
              } else {
                context.read<UsersCubit>().toUserLoaded();
                print('Go Login');
                return Scaffold(
                  body: Center(
                    child: Container(
                      height: 30,
                      width: 30,
                      child: loading(4),
                    ),
                  ),
                );
              }
            },
          );
        } else {
          context.read<UsersCubit>().toUserLoaded();
          print('Go Login');
          return Scaffold(
            body: Center(
              child: Container(
                height: 30,
                width: 30,
                child: loading(4),
              ),
            ),
          );
        }
      },
    );
  }

  Future subscribeNotification(String subscribe, String unSubscribe) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(unSubscribe);
    await FirebaseMessaging.instance.subscribeToTopic(subscribe);
  }
}
