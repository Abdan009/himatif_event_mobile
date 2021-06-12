part of 'widgets.dart';

typedef void ReturnMemberJoinWidget(String name);

class MemberJoinWidget extends StatefulWidget {
  final ReturnMemberJoinWidget result;
  final String title;
  MemberJoinWidget({
    @required this.title,
    @required this.result,
  });
  @override
  _MemberJoinWidgetState createState() => _MemberJoinWidgetState();
}

class _MemberJoinWidgetState extends State<MemberJoinWidget> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FieldInputDua(
      nameController,
      widget.title,
      onChange: (value) {
        widget.result(value);
      },
    );
  }
}
