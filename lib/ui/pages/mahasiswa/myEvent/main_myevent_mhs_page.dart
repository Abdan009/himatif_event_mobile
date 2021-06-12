part of '../../pages.dart';

class MainEventMhsPage extends StatefulWidget {
  @override
  _MainEventMhsPageState createState() => _MainEventMhsPageState();
}

class _MainEventMhsPageState extends State<MainEventMhsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Event Saya'),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: mainColor,
          ),
          onPressed: () async {
            await Get.to(() => UpdateEventAdminPage()).then((value) {
              setState(() {});
            });
          },
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      body: BlocBuilder<JoineventCubit, JoineventState>(
        builder: (_, joinState) {
          if (joinState is JoineventLoaded) {
            List<JoinEvent> joinEvent = joinState.myJoinEvent ?? [];
            List<EventInfo> myContribution =
                (context.read<EventCubit>().state as EventLoaded)
                        .myContributionEvent ??
                    [];
            return Column(
              children: [
                Expanded(
                  child: buildMyRegisterEvent(joinEvent),
                ),
                Divider(
                  thickness: 3,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Text(
                            'Kontribusi Info Event',
                            style: blackTextFont.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Divider(),
                        Expanded(
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: (myContribution.isNotEmpty)
                                ? ListView.builder(
                                    itemCount: myContribution.length,
                                    itemBuilder: (_, index) => Container(
                                      margin: EdgeInsets.only(
                                          bottom: (index ==
                                                  myContribution.length - 1)
                                              ? 30
                                              : 10),
                                      child: GestureDetector(
                                          onTap: () async {
                                            await Get.to(
                                              () => DetailEventAdminPage(
                                                myContribution[index],
                                              ),
                                            ).then((value) {
                                              setState(() {});
                                            });
                                          },
                                          child: CardListEventWidget(
                                            myContribution[index],
                                          )),
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text('Belum terdapat kontribusi',
                                          style: blackTextFont.copyWith(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
                child: SizedBox(
              height: 20,
              width: 20,
              child: loading(3),
            ));
          }
        },
      ),
    );
  }

  Widget buildMyRegisterEvent(List<JoinEvent> joinEvent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Text(
            'Event yang Dikuti',
            style: blackTextFont.copyWith(
                fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Divider(),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (joinEvent.isNotEmpty)
                ? ListView.builder(
                    itemCount: joinEvent.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          bottom: (index == joinEvent.length - 1) ? 30 : 10),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => DetailRegistrationPage(
                                joinEvent[index],
                              ),
                            );
                          },
                          child: CardListEventWidget(
                            joinEvent[index].event,
                          )),
                    ),
                  )
                : Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text('Belum terdapat event',
                          style: blackTextFont.copyWith(
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
