part of '../pages.dart';

class HomeMhsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CarouselController carouselController = CarouselController();
    Users user = (context.read<UsersCubit>().state as UsersLoaded).user;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          child: Text('HimatifEvent',
              style: fontHeadline.copyWith(fontWeight: FontWeight.w900)),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.search, color: accentColor2),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.message, color: accentColor2),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications, color: accentColor2),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            buildHeaderProfilName(user),
            buildCarouserlSlider(context),
            buildKategoriEvent(context),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (_, categoryState) =>
                  BlocBuilder<EventCubit, EventState>(
                builder: (_, eventState) {
                  if (eventState is EventLoaded) {
                    List<EventInfo> listEvent = eventState.listEvent;
                    if ((categoryState as CategoryLoaded).category != 'Semua') {
                      listEvent = listEvent
                          .where((element) =>
                              element.category ==
                              (categoryState as CategoryLoaded).category)
                          .toList();
                    }
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: (listEvent.isNotEmpty)
                          ? Column(
                              children: List.generate(
                                listEvent.length,
                                (index) => Container(
                                  margin: EdgeInsets.only(
                                    bottom: (index == listEvent.length - 1)
                                        ? 30
                                        : 15,
                                    top: (index == 0) ? 10 : 0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => DetailEventMhsPage(
                                          listEvent[index],
                                        ),
                                      );
                                    },
                                    child: CardListEventWidget(
                                      listEvent[index],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Text('Tidak terdapat event',
                                  style: fontTitle),
                            ),
                    );
                  } else if (eventState is EventFailed) {
                    return Center(
                        child: Text('Terjadi masalah, harap coba kembali !'));
                  } else {
                    return Column(
                      children: [
                        Container(height: 30, width: 30, child: loading(4.0)),
                      ],
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildKategoriEvent(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (_, categoryState) {
        if (categoryState is CategoryLoaded) {
          List<CategoryEvent> listCategory = categoryState.listCategory;

          return Container(
            height: 27,
            margin: EdgeInsets.only(top: 20, bottom: 20),
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

  Container buildCarouserlSlider(BuildContext context) {
    return Container(
      child: BlocBuilder<CurrentCubit, CurrentState>(
        builder: (_, currentState) => Column(
          children: [
            CarouselSlider(
              // carouselController: carouselController,
              items: mockBanner
                  .map(
                    (banner) => Builder(
                      builder: (_) {
                        return CacheImageCustom(
                          url: banner.bannerUrl,
                          imageBuilder: (_, imageProv) {
                            return Container(
                              width: Get.width * 0.8,
                              height: 115,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProv,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 115,
                autoPlay: true,
                onPageChanged: (index, _) {
                  // currentState.current(index);
                  context.read<CurrentCubit>().changeCurrent(index);
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: defaultMargin),
              child: Row(
                children: List.generate(
                  mockBanner.length,
                  (index) => Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (index == currentState.current)
                            ? mainColor
                            : accentColor2),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildHeaderProfilName(Users user) {
    return Container(
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
                    Text(
                      'Halo, ',
                      style: fontBody1.copyWith(color: accentColor2),
                    ),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
