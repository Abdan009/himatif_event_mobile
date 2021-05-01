part of 'widgets.dart';

class CardEventWidget extends StatefulWidget {
  final EventInfo event;
  CardEventWidget(this.event);

  @override
  _CardEventWidgetState createState() => _CardEventWidgetState();
}

class _CardEventWidgetState extends State<CardEventWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   () => DetaileventPage(widget.event),
        // );
      },
      child: Container(
        height: (Get.height / 3) + 50,
        margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height / 3 - 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(widget.event.posterEvent),
                    fit: BoxFit.cover),
              ),
            ),
            BlocBuilder<UsersCubit, UsersState>(
              builder: (_, userState) => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                widget.event.name,
                                style: blackTextFont.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //     "Upload : " + widget.event.timeCreate.dateAndTimeNumber,
                    //     style: blackTextFont),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(
                                    'Batas Pendaftaran',
                                    style: blackTextFont,
                                  ),
                                ),
                                Container(
                                  width: Get.width / 2,
                                  child: Text(
                                      widget.event.timeReglimit.dateAndTime),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(
                                    'Kegiatan',
                                    style: blackTextFont,
                                  ),
                                ),
                                Container(
                                  width: Get.width / 2,
                                  child:
                                      Text(widget.event.timeStart.dateAndTime),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 2,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
