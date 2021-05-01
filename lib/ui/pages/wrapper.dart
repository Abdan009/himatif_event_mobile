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
          await context.read<UsersCubit>().toUserLoaded();
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
        return BlocBuilder<UsersCubit, UsersState>(
          builder: (_, userState) {
            if (userState is UsersLoaded) {
              if (userState.user != null) {
                context.read<EventCubit>().getListEvent();
                context.read<CategoryCubit>().getListCategory();
                return HomeAdminPage();
              } else {
                return LoginPage();
              }
            } else {
              context.read<UsersCubit>().toUserLoaded();
              print('Go Login');
              return LoginPage();
            }
          },
        );
      },
    );
  }
}
