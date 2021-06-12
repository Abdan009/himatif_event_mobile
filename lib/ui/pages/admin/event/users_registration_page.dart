part of '../../pages.dart';

class UsersRegistrationPage extends StatelessWidget {
  final int idEvent;
  UsersRegistrationPage(this.idEvent);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar("Pendaftar Event"),
      body:
          BlocBuilder<JoineventCubit, JoineventState>(builder: (_, joinState) {
        List<JoinEvent> listUserJoin = (joinState as JoineventLoaded)
            .allJointEvent
            .where((element) => element.idEvent == idEvent)
            .toList();
        return ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            if (listUserJoin.isNotEmpty)
              Column(
                children: List.generate(listUserJoin.length, (index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(() =>
                            DetailRegistrationAdminPage(listUserJoin[index]));
                      },
                      child: buildHeaderProfilName(listUserJoin[index].user));
                }),
              ),
            if (listUserJoin.isEmpty)
              Center(
                child: Text('Belum ada pengguna yang mendaftar',
                    style: blackTextFont),
              ),
            SizedBox(
              height: 50,
            ),
          ],
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
              Container(
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
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
