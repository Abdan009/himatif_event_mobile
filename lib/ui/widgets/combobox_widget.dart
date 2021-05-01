part of 'widgets.dart';

class ComboboxWidget extends StatefulWidget {
  final List<String> list;
  final Function(dynamic) onChange;
  final dynamic value;
  final String text;
  ComboboxWidget(
      {@required this.list,
      @required this.onChange,
      @required this.value,
      @required this.text});
  @override
  _ComboboxWidgetState createState() => _ComboboxWidgetState();
}

class _ComboboxWidgetState extends State<ComboboxWidget> {
  List<DropdownMenuItem> generateItem() {
    List<DropdownMenuItem> items = [];

    for (var item in widget.list) {
      items.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        //width: MediaQuery.of(context).size.width / 2 - 20,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: accentColor2),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: DropdownButton(
              hint: Text(widget.text, style: blackTextFont,),
              isExpanded: true,
              underline: Container(),
              value: widget.value,
              items: generateItem(),
              onChanged: widget.onChange),
        ));
  }
}
