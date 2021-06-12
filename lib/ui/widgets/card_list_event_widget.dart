part of 'widgets.dart';

class CardListEventWidget extends StatelessWidget {
  final EventInfo event;
  CardListEventWidget(this.event);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
              color: accentColor2),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 130,
            width: Get.width * 0.3,
            child: CacheImageCustom(
              url: event.posterEvent,
              imageBuilder: (_, imageProv) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: imageProv, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      event.category,
                      style: fontSubtitle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: (Get.width * 0.5) - 34,
                  height: 40,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    event.name,
                    style: fontTitle.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.2,
                        child: Text(
                          'Batas Daftar',
                          style: fontCaption,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: Get.width * 0.2,
                        child: Text(
                          event.timeReglimit.dateAndTimeNumber,
                          style:
                              fontCaption.copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.2,
                        child: Text(
                          'Pelaksanaan',
                          style: fontCaption,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: Get.width * 0.2,
                        child: Text(
                          event.timeStart.dateAndTimeNumber,
                          style:
                              fontCaption.copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     loadingDialog(context).show();

          //     context.read<EventCubit>().deleteEvent(event.id).then(
          //       (value) {
          //         loadingDialog(context).hide();
          //       },
          //     );
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(right: defaultMargin),
          //     child: Icon(
          //       Icons.delete,
          //       color: Colors.red,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
