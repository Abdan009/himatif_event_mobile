part of 'widgets.dart';

class FieldCustomWidget extends StatelessWidget {
  final String title, hint;
  final bool obscureText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final double height;
  final int maxLine;
  final List<TextInputFormatter> inputFormater;
  final TextInputType typeKeyboard;
  final TextAlign align;
  final bool isCurrency;
  final TextStyle style;
  final Function(String) onChange;
  final Color primaryColor;
  final Widget suffixIcon;

  FieldCustomWidget({
    this.title,
    @required this.hint,
    @required this.controller,
    this.height = 60,
    this.obscureText = false,
    this.prefixIcon,
    this.maxLine,
    this.inputFormater,
    this.typeKeyboard,
    this.align,
    this.isCurrency = false,
    this.style,
    this.onChange,
    this.primaryColor,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: primaryColor ?? mainColor),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (title != null)
              Text(
                title,
                style: blackTextFont.copyWith(fontWeight: FontWeight.bold),
              ),
            if (title != null) SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle(),
              height: height,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: controller,
                style: style ?? blackTextFont.copyWith(fontSize: 16),
                obscureText: obscureText,
                textAlign: align ?? TextAlign.start,
                cursorColor: mainColor,
                onChanged: onChange,
                cursorHeight: !isCurrency ? 20 : 40,
                maxLines: maxLine,
                textAlignVertical: (prefixIcon == null)
                    ? TextAlignVertical.top
                    : TextAlignVertical.center,
                keyboardType: !isCurrency
                    ? ((typeKeyboard == null)
                        ? TextInputType.text
                        : typeKeyboard)
                    : TextInputType.numberWithOptions(),
                inputFormatters: !isCurrency
                    ? ((inputFormater != null) ? inputFormater : null)
                    : [
                        // CurrencyTextInputFormatter(
                        //     locale: 'id', decimalDigits: 0, symbol: 'Rp '),
                      ],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: (prefixIcon != null)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              prefixIcon,
                            ],
                          )
                        : null,
                    hintText: hint,
                    hintStyle: !isCurrency
                        ? (greyTextFont.copyWith(fontSize: 16))
                        : style,
                    suffixIcon: (suffixIcon != null)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              suffixIcon,
                            ],
                          )
                        : null),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDecorationStyle() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6.0,
          offset: Offset(0, 2),
        ),
      ],
    );
  }
}
