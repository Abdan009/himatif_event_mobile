part of '../../pages.dart';

class DetailRegistrationAdminPage extends StatelessWidget {
  final JoinEvent joinEvent;
  DetailRegistrationAdminPage(this.joinEvent);
  @override
  Widget build(BuildContext context) {
    String linkWhatsApp =
        "https://api.whatsapp.com/send?phone=62${joinEvent.contactLeader}";
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
                  // Get.to(() => DetailEventMhsPage(joinEvent.event));
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
                "+62" + joinEvent.contactLeader,
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: mainColor,
              ),
              onPressed: () async {
                await launch(linkWhatsApp);
              },
              child: Text('WhatsApp', style: whiteTextFont),
            )
          ],
        ),
      ),
    );
  }
}
