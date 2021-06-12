part of '../../pages.dart';

class ListUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Daftar Pengguna'),
      body: BlocBuilder<UsersCubit, UsersState>(builder: (_, userState) {
        List<Users> listUser = (userState as UsersLoaded).listUser ?? [];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                  children: List.generate(
                mockUser.length,
                (index) => buildHeaderProfilName(
                  mockUser[index],
                ),
              ))
            ],
          ),
        );
      }),
    );
  }

  Column buildHeaderProfilName(Users user) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 90,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          color: Colors.white,
          child: Row(
            children: [
              CacheImageCustom(
                url: user.photoURL,
                imageBuilder: (_, imageProv) => Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: imageProv, fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  width: Get.width - (defaultMargin * 2) - 90,
                  // color: mainColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text(
                              user.name,
                              style: fontTitle,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        user.studyProgram,
                        style: fontBody2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
