part of '../pages.dart';

class ProfilMhsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Profil'),
      body: BlocBuilder<UsersCubit, UsersState>(builder: (_, userState) {
        if (userState is UsersLoaded) {
          Users user = userState.user;
          return Container(
            child: ListView(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: accentColor1, shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Nama Lengkap',
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(user.name)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Jurusan',
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(user.majors)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Program Studi',
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(user.studyProgram)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Alamat',
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(user.address)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: Get.width / 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Logout',
                          style: whiteTextFont.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          context.read<UsersCubit>().logout();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Center(
            child: loading(4),
          );
        }
      }),
    );
  }
}
