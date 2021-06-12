part of 'widgets.dart';

typedef SearchParm(String value);

class SearchWidget extends StatefulWidget {
  final SearchParm search;
  SearchWidget({
    @required this.search,
    // @required this.onChange,
  });

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(color: mainColor),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width - (4 * defaultMargin),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    widget.search(value);
                  });
                },
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    hintText: "Cari",
                    border: InputBorder.none),
              ),
            ),
            (searchController.text.trim() != '')
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        widget.search(null);
                        searchController.text = '';
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {})
          ],
        ),
      ),
    );
  }
}
