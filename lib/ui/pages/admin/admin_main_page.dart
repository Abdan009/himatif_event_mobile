part of '../pages.dart';

class HomeAdminPage extends StatefulWidget {
  @override
  _HomeAdminPageState createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (_, userState) {
          if (userState is UsersLoaded) {
            return Stack(
              children: [
                Container(color: mainColor),
                SafeArea(child: Container(color: Color(0xFFF6F7F9))),
                buildMenuItem(context),
                //Header
                buildHeader(context, userState.user),
              ],
            );
          } else {
            return loading(4);
          }
        },
      ),
    );
  }

  SafeArea buildMenuItem(
    BuildContext context,
  ) {
    return SafeArea(
        child: Container(
      margin:
          EdgeInsets.only(top: 270, right: defaultMargin, left: defaultMargin),
      child: ListView(
        children: [
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              Card(
                child: GestureDetector(
                  onTap: () {
                    Get.to(EventAdminPage());
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 2 -
                        (2 * defaultMargin) -
                        5,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.date_range,
                          color: mainColor,
                          size: 80,
                        ),
                        Text(
                          "Event",
                          style: orangeTextFont,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => CategoryPage());
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 2 -
                        (2 * defaultMargin) -
                        5,
                    height: 120,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.category,
                                  color: mainColor,
                                  size: 80,
                                ),
                                Text(
                                  "Kategori Event",
                                  style: orangeTextFont,
                                )
                              ],
                            ),
                          ),
                        ),
                        //edit
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: Container(
                        //     height: 30,
                        //     width: 30,
                        //     decoration: BoxDecoration(
                        //         color: mainColor,
                        //         borderRadius: BorderRadius.circular(5)),
                        //     child: Center(
                        //       child: Text(
                        //         '100',
                        //         style: whiteTextFont,
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(ListUsahaPage());
                },
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 2 -
                        (2 * defaultMargin) -
                        5,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          color: mainColor,
                          size: 80,
                        ),
                        Text(
                          "Pengguna",
                          style: orangeTextFont,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(ListUsahaPage());
                },
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 2 -
                        (2 * defaultMargin) -
                        5,
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: mainColor,
                          size: 80,
                        ),
                        Text(
                          "Pengaturan",
                          style: orangeTextFont,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: Get.width / 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: mainColor),
              child: Text(
                'Logout',
                style: whiteTextFont.copyWith(fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                await context.read<UsersCubit>().logout();
                Get.offAll(() => WrapperUser());
              },
            ),
          ),
        ],
      ),
    ));
  }

  SafeArea buildHeader(BuildContext context, Users user) {
    return SafeArea(
        child: Container(
      height: 256,
      child: Stack(
        children: [
          Container(
            height: 256,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 50,
              // color: Colors.blue,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Get.to(ProfilPedagangPage());
                      },
                      child: Container(
                        color: mainColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: whiteTextFont.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Admin Himatif',
                              style: whiteTextFont,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(NotifikasiPedagangPage(listNotif));
                    },
                    child: Container(
                      child: Stack(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 30,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: mainColor,
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                  child: Text(
                                '5',
                                style: whiteTextFont.copyWith(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 96,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin - 25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Total",
                                  style: blackTextFont.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                BlocBuilder<EventCubit, EventState>(
                                  builder: (_, eventState) {
                                    if (eventState is EventLoaded) {
                                      List<EventInfo> listEvent =
                                          eventState.listEvent;
                                      return Text(
                                        listEvent.length.toString(),
                                        style: orangeTextFont.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      );
                                    } else {
                                      return loading(2);
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "event",
                                  style: blackTextFont.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            height: 30,
                            width: 3,
                            color: mainColor,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Selesai",
                                  style: blackTextFont.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                BlocBuilder<EventCubit, EventState>(
                                  builder: (_, eventState) {
                                    if (eventState is EventLoaded) {
                                      List<EventInfo> listEvent = eventState
                                          .listEvent
                                          .where(
                                            (element) =>
                                                element.status == 'Publish' &&
                                                element.timeStart.isBefore(
                                                  DateTime.now(),
                                                ),
                                          )
                                          .toList();
                                      return Text(
                                        listEvent.length.toString(),
                                        style: orangeTextFont.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      );
                                    } else {
                                      return loading(2);
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "event",
                                  style: blackTextFont.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
