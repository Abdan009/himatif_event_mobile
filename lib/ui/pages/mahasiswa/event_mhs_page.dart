part of '../pages.dart';

class EventMhsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Event Saya'),
      body: Center(
        child: GestureDetector(
            onTap: () async {
              await NotifikasiServices.sendAndRetrieveMessage('Hallo', 'Abdan',
                  topic: 'mahasiswa');
            },
            child: Text('Belum ada event yang kamu ikuti', style: fontTitle)),
      ),
    );
  }
}
