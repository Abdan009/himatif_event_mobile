part of 'widgets.dart';

class BottomButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final List<Widget> listWidget;
  final Color color;
  BottomButtonWidget({
    this.title,
    @required this.onTap,
    this.listWidget,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
            blurRadius: 5,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Button Pemesanan
            (listWidget == null)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: onTap ?? () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                          decoration: BoxDecoration(
                            color: color ?? mainColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              title,
                              style: whiteTextFont.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : listWidget,
          ],
        ),
      ),
    );
  }
}
