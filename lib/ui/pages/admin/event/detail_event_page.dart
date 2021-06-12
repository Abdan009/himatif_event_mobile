part of '../../pages.dart';

class DetailEventAdminPage extends StatelessWidget {
  final EventInfo eventParm;
  DetailEventAdminPage(this.eventParm);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(builder: (_, eventState) {
      EventInfo event = (eventState as EventLoaded).listEvent.firstWhere(
          (element) => element.id == eventParm.id,
          orElse: () => null);

      return Scaffold(
        appBar: appBar(
          event?.name ?? '',
          actions: [
            GestureDetector(
              onTap: () {
                loadingDialog(context).show();

                context.read<EventCubit>().deleteEvent(eventParm).then(
                  (value) {
                    loadingDialog(context).hide();
                    Get.back();
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: defaultMargin),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              if (event != null)
                ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CacheImageCustom(
                        url: event.posterEvent,
                        imageBuilder: (_, imageProv) => Container(
                          height: Get.height * 0.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProv, fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            margin: EdgeInsets.only(bottom: 10),
                            width: 100,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                event.category,
                                style:
                                    fontSubtitle.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: Get.width - (2 * defaultMargin),
                            child: Text(
                              event.name,
                              style: fontTitle.copyWith(fontSize: 20),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 5,
                      color: accentColor1,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: blackTextFont.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  event.status + "  ",
                                  style: orangeTextFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                if ((context.read<UsersCubit>().state
                                            as UsersLoaded)
                                        .user
                                        .roles !=
                                    'mahasiswa')
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) => Dialog(
                                                  child: Container(
                                                    height: 200,
                                                    margin: EdgeInsets.all(20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Ubah Status',
                                                          style: blackTextFont
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18),
                                                        ),
                                                        Container(
                                                          width: Get.width,
                                                          height: 40,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10,
                                                                  top: 20),
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary:
                                                                  mainColor,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await editStatusEvent(
                                                                  context,
                                                                  event,
                                                                  'Pending');
                                                            },
                                                            child: Text(
                                                              'Pending',
                                                              style: whiteTextFont
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: Get.width,
                                                          height: 40,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10),
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary:
                                                                  mainColor,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await editStatusEvent(
                                                                  context,
                                                                  event,
                                                                  'Publish');
                                                            },
                                                            child: Text(
                                                              'Publish',
                                                              style: whiteTextFont
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: Get.width,
                                                          height: 40,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10),
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary:
                                                                  Colors.red,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await editStatusEvent(
                                                                  context,
                                                                  event,
                                                                  'Canceled');
                                                            },
                                                            child: Text(
                                                              'Canceled',
                                                              style: whiteTextFont
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                      },
                                      child:
                                          Icon(Icons.edit, color: mainColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 5,
                      color: accentColor1,
                    ),
                    buildTimeEvent(
                        'Jadwal Pelaksanaan',
                        Icons.calendar_today,
                        event.timeStart.dateAndTimeLahir,
                        event.timeStart.clockTime),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: accentColor1,
                    ),
                    buildTimeEvent(
                        'Batas Pendaftaran',
                        Icons.alarm,
                        event.timeReglimit.dateAndTimeLahir,
                        event.timeReglimit.clockTime),
                    Divider(
                      height: 20,
                      thickness: 5,
                      color: accentColor1,
                    ),
                    buildBodyEvent('Biaya', event.cost),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: accentColor1,
                    ),
                    buildBodyEvent('Lokasi', event.location),
                    Divider(
                      height: 20,
                      thickness: 5,
                      color: accentColor1,
                    ),
                    buildOrganizer(event),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: accentColor1,
                    ),
                    buildBodyEvent('Deskripsi', event.description),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: accentColor1,
                    ),
                    buildBodyEvent(
                        'Persyaratan dan Ketentuan', event.requirements),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: accentColor1,
                    ),
                    buildBodyEvent('Keuntungan/Manfaat', event.benefits),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 0),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: accentColor2),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => UsersRegistrationPage(event.id));
                          },
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Cek Pendaftar',
                                style: fontTitle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => UpdateEventAdminPage(
                                event: event,
                              ),
                            );
                          },
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Update',
                                style: fontTitle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Container buildBodyEvent(String title, String body) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: fontTitle.copyWith(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(body, style: fontBody1),
          )
        ],
      ),
    );
  }

  Container buildOrganizer(EventInfo event) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Penyelenggara',
                  style: fontBody1.copyWith(
                      fontWeight: FontWeight.bold, color: accentColor2),
                ),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(event.organizer, style: fontTitle)),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: mainColor, shape: BoxShape.circle),
            child: Center(
              child: Icon(Icons.message, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Container buildTimeEvent(
      String title, IconData icon, String date, String time) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 23,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: fontTitle.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.5 - defaultMargin,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hari, Tanggal',
                        style: fontBody1.copyWith(
                            fontWeight: FontWeight.bold, color: accentColor2),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        date,
                        style: fontBody1.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 50,
                  color: accentColor1,
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Pukul',
                        style: fontBody1.copyWith(
                            fontWeight: FontWeight.bold, color: accentColor2),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        time + ' WIB',
                        style: fontBody1.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Future editStatusEvent(
      BuildContext context, EventInfo event, String status) async {
    loadingDialog(context, message: "Mengubah Status event").show();
    await context
        .read<EventCubit>()
        .updateEvent(event.copyWith(status: status), null);
    EventState state = context.read<EventCubit>().state;
    if (state is EventLoaded) {
      loadingDialog(
        context,
      ).hide();
      Get.back();
    } else {
      flushbar('Mengedit status event gagal, harap mencoba kembali !', context);
      loadingDialog(
        context,
      ).hide();
      Get.back();
    }
  }
}
