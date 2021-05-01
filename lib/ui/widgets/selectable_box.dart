part of "widgets.dart";

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnable;
  final double width;
  final double height;
  final dynamic text;
  final Function onTap;
  final TextStyle textStyle;

  SelectableBox(this.text,
      {this.isSelected = false,
      this.isEnable = true,
      this.height = 60,
      this.onTap,
      this.textStyle,
      this.width = 144});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: (!isEnable)
                ? Color(0xFFE4E4E4)
                : isSelected
                    ? accentColor3
                    : Colors.transparent,
            border: Border.all(
                color: (!isEnable)
                    ? Color(0xFFE4E4E4)
                    : isSelected
                        ? Colors.transparent
                        : Color(0xFFE4E4E4))),
        child: Center(
          child: Text(
            text ?? "None",
            textAlign: TextAlign.center,
            style: textStyle ??
                blackTextFont.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
