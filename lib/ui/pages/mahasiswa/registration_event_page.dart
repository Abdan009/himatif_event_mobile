part of '../pages.dart';

class RegistrationEventPage extends StatefulWidget {
  final EventInfo event;
  RegistrationEventPage(this.event);
  @override
  _RegistrationEventPageState createState() => _RegistrationEventPageState();
}

class _RegistrationEventPageState extends State<RegistrationEventPage> {
  TextEditingController nameLeaderController = TextEditingController();
  TextEditingController contectController = TextEditingController();
  TextEditingController schemaController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  List<String> listMember = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Daftar Event"),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                FieldInputDua(nameLeaderController, 'Nama Ketua'),
                SizedBox(
                  height: 10,
                ),
                FieldInputDua(
                  contectController,
                  'Nomor Hp Ketua',
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+62",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  inputFormater: [FilteringTextInputFormatter.digitsOnly],
                  typeText: TextInputType.numberWithOptions(),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Column(
                        children: List.generate(
                  listMember.length + 1,
                  (index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      child: MemberJoinWidget(
                          title: "Anggota ${index + 1}",
                          result: (result) {
                            if (index != listMember.length) {
                              listMember[index] = result;
                            } else {
                              listMember.add(result);
                            }
                            if (result.trim() == '') {
                              listMember.removeAt(index);
                            }
                            print(listMember[0]);
                            setState(() {});
                          }),
                    );
                  },
                ))),
                SizedBox(
                  height: 10,
                ),
                FieldInputDua(schemaController, 'Skema'),
                SizedBox(
                  height: 10,
                ),
                FieldInputDua(noteController, 'Catatan'),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          BottomButtonWidget(
              title: "Daftar",
              onTap: () async {
                if (!(nameLeaderController.text.trim() != "" &&
                    contectController.text.trim() != "" &&
                    schemaController.text.trim() != "" &&
                    noteController.text.trim() != "")) {
                  flushbar('Harap isi semua data terlebih dahulu', context);
                } else {
                  loadingDialog(context, message: "Daftar Event").show();
                  JoinEvent join = JoinEvent(
                    idUser: (context.read<UsersCubit>().state as UsersLoaded)
                        .user
                        .id,
                    idEvent: widget.event.id,
                    nameLeader: nameLeaderController.text,
                    nameMember: (listMember.isEmpty)
                        ? null
                        : listBidangToString(listMember),
                    contactLeader: contectController.text,
                    schema: schemaController.text,
                    note: noteController.text,
                  );
                  await context.read<JoineventCubit>().addJoinEvent(join);
                  JoineventState state = context.read<JoineventCubit>().state;

                  if (state is JoineventLoaded) {
                    Get.offAll(() => MainEventMhsPage());
                  } else {
                    loadingDialog(context).hide();
                    flushbar('Gegal mendaftar, harap coba kembali', context);
                  }
                }
              }),
        ],
      ),
    );
  }
}
