part of '../../pages.dart';

class EventAdminPage extends StatefulWidget {
  @override
  _EventAdminPageState createState() => _EventAdminPageState();
}

class _EventAdminPageState extends State<EventAdminPage> {
  TextEditingController searchController1 = TextEditingController();
  TextEditingController searchController2 = TextEditingController();
  TextEditingController searchController3 = TextEditingController();

  String search1;
  String search2;
  String search3;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: mainColor,
            title: Text("Event"),
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Tab(text: 'Pengajuan'),
              Tab(text: 'Berjalan'),
              Tab(text: 'Kadaluwarsa'),
            ]),
          ),
          body: TabBarView(children: [
            buildListEvent1(),
            buildListEvent2(),
            buildListEvent3(),
          ])),
    );
  }

  Widget buildListEvent1() {
    return Column(
      children: [
        SearchWidget(search: (value) {
          setState(() {
            search1 = value;
          });
        }),
        buildKategoriEvent(context),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (_, categoryState) =>
                  BlocBuilder<EventCubit, EventState>(
                builder: (_, eventState) {
                  if (eventState is EventLoaded) {
                    List<EventInfo> listEvent = eventState.listEvent
                        .where(
                          (element) =>
                              element.status == 'Pending' &&
                              element.timeReglimit.isAfter(
                                DateTime.now(),
                              ),
                        )
                        .toList();
                    if ((categoryState as CategoryLoaded).category != 'Semua') {
                      listEvent = listEvent
                          .where((element) =>
                              element.category ==
                              (categoryState as CategoryLoaded).category)
                          .toList();
                    }
                    if (search1 != null) {
                      listEvent = listEvent
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(search1.toLowerCase()))
                          .toList();
                    }

                    return (listEvent.isNotEmpty)
                        ? ListView.builder(
                            itemCount: listEvent.length,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                  bottom:
                                      (index == listEvent.length - 1) ? 30 : 15,
                                  top: (index == 0) ? 10 : 0,
                                ),
                                child: GestureDetector(
                                    onTap: () async {
                                      await Get.to(
                                        () => DetailEventAdminPage(
                                            listEvent[index]),
                                      ).then((value) {
                                        setState(() {});
                                      });
                                    },
                                    child:
                                        CardListEventWidget(listEvent[index])),
                              );
                            },
                          )
                        : Center(
                            child: Text('Tidak ada event'),
                          );
                  } else {
                    return Center(
                      child: loading(4.0),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildListEvent2() {
    return Stack(
      children: [
        Column(
          children: [
            SearchWidget(search: (value) {
              setState(() {
                search2 = value;
              });
            }),
            buildKategoriEvent(context),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (_, categoryState) =>
                      BlocBuilder<EventCubit, EventState>(
                    builder: (_, eventState) {
                      if (eventState is EventLoaded) {
                        List<EventInfo> listEvent = eventState.listEvent
                            .where(
                              (element) =>
                                  element.status == 'Publish' &&
                                  element.timeReglimit.isAfter(
                                    DateTime.now(),
                                  ),
                            )
                            .toList();
                        if ((categoryState as CategoryLoaded).category !=
                            'Semua') {
                          listEvent = listEvent
                              .where((element) =>
                                  element.category ==
                                  (categoryState as CategoryLoaded).category)
                              .toList();
                        }
                        if (search2 != null) {
                          listEvent = listEvent
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(search2.toLowerCase()))
                              .toList();
                        }

                        return (listEvent.isNotEmpty)
                            ? ListView.builder(
                                itemCount: listEvent.length,
                                itemBuilder: (_, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      bottom: (index == listEvent.length - 1)
                                          ? 30
                                          : 15,
                                      top: (index == 0) ? 20 : 0,
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            () => DetailEventAdminPage(
                                                listEvent[index]),
                                          );
                                        },
                                        child: CardListEventWidget(
                                            listEvent[index])),
                                  );
                                },
                              )
                            : Center(
                                child: Text('Tidak ada event'),
                              );
                      } else {
                        return Center(
                          child: loading(4.0),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              Get.to(() => UpdateEventAdminPage());
            },
            child: Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                color: mainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildListEvent3() {
    return Column(
      children: [
        SearchWidget(search: (value) {
          setState(() {
            search3 = value;
          });
        }),
        buildKategoriEvent(context),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (_, categoryState) =>
                  BlocBuilder<EventCubit, EventState>(
                builder: (_, eventState) {
                  if (eventState is EventLoaded) {
                    List<EventInfo> listEvent = eventState.listEvent
                        .where(
                          (element) =>
                              element.status == 'Canceled' ||
                              element.timeReglimit.isBefore(
                                DateTime.now(),
                              ),
                        )
                        .toList();
                    if ((categoryState as CategoryLoaded).category != 'Semua') {
                      listEvent = listEvent
                          .where((element) =>
                              element.category ==
                              (categoryState as CategoryLoaded).category)
                          .toList();
                    }
                    if (search3 != null) {
                      listEvent = listEvent
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(search3.toLowerCase()))
                          .toList();
                    }
                    return (listEvent.isNotEmpty)
                        ? ListView.builder(
                            itemCount: listEvent.length,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                  bottom:
                                      (index == listEvent.length - 1) ? 30 : 15,
                                  top: (index == 0) ? 20 : 0,
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => DetailEventAdminPage(
                                            listEvent[index]),
                                      );
                                    },
                                    child:
                                        CardListEventWidget(listEvent[index])),
                              );
                            },
                          )
                        : Center(
                            child: Text('Tidak ada event'),
                          );
                  } else {
                    return Center(
                      child: loading(4.0),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildKategoriEvent(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (_, categoryState) {
        if (categoryState is CategoryLoaded) {
          List<CategoryEvent> listCategory = categoryState.listCategory;
          return Container(
            height: 27,
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: ListView.builder(
              itemCount: listCategory.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  context
                      .read<CategoryCubit>()
                      .selectedCategory(listCategory[index].name);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultMargin : 10,
                      right: (index == listCategory.length - 1)
                          ? defaultMargin
                          : 0),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: (categoryState.category == listCategory[index].name)
                        ? mainColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: (categoryState.category == listCategory[index].name)
                        ? null
                        : Border.all(color: mainColor),
                  ),
                  child: Center(
                    child: Text(
                      listCategory[index].name,
                      style: fontBody2.copyWith(
                          color: (categoryState.category ==
                                  listCategory[index].name)
                              ? Colors.white
                              : mainColor),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return loading(2);
        }
      },
    );
  }
}
