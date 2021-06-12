part of '../../pages.dart';

class DetailRegistrationPage extends StatelessWidget {
  final JoinEvent joinEvent;
  DetailRegistrationPage(this.joinEvent);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Detail Pendaftaran"),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => DetailEventMhsPage(joinEvent.event));
                },
                child: CardListEventWidget(joinEvent.event)),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                "Nama Ketua",
                style: blackTextFont.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                joinEvent.nameLeader,
                style: blackTextFont,
              ),
            ),
            ListTile(
              title: Text(
                "Nomor Hp Ketua",
                style: blackTextFont.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                joinEvent.contactLeader,
                style: blackTextFont,
              ),
            ),
            ListTile(
              title: Text(
                "Nama Anggota",
                style: blackTextFont.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                joinEvent.nameMember ?? "-",
                style: blackTextFont,
              ),
            ),
            ListTile(
              title: Text(
                "Skema",
                style: blackTextFont.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                joinEvent.schema,
                style: blackTextFont,
              ),
            ),
            ListTile(
              title: Text(
                "Catatan",
                style: blackTextFont.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                joinEvent.note,
                style: blackTextFont,
              ),
            ),
            ListTile(
              tileColor: accentColor1,
              title: Text(
                  'Selanjutnya anda akan segera di hubungi oleh panilia lomba HIMATIF',
                  style: blackTextFont),
            ),
          ],
        ),
      ),
    );
  }
}
