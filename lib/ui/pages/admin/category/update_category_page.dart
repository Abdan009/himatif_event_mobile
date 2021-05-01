part of '../../pages.dart';

class UpdateCategory extends StatefulWidget {
  final CategoryEvent category;
  UpdateCategory({this.category});
  @override
  _UpdateCategoryState createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      nameController.text = widget.category.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Edit Kategori'),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            FieldInputDua(nameController, 'Nama'),
            SizedBox(
              height: 20,
            ),
            (!isLoading)
                ? Center(
                    child: BlocBuilder<UsersCubit, UsersState>(
                      builder: (_, userState) => Container(
                        width: 190,
                        height: 43,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(51),
                              ),
                              primary: mainColor,
                              elevation: 0),
                          child: Text(
                            (widget.category == null) ? "Tambahkan" : "Edit",
                            style: whiteTextFont.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            if (nameController.text.trim() == '') {
                              flushbar('Harap isi nama Kategori', context);
                            } else {
                              isLoading = true;
                              CategoryEvent category;
                              if (widget.category == null) {
                                category =
                                    CategoryEvent(name: nameController.text);
                                await context
                                    .read<CategoryCubit>()
                                    .addCategory(category);
                              } else {
                                category = widget.category
                                    .copyWith(name: nameController.text);
                                await context
                                    .read<CategoryCubit>()
                                    .updateCategory(category);
                              }
                              final state = context.read<CategoryCubit>().state;
                              if (state is CategoryLoaded) {
                                Get.back();
                              } else {
                                isLoading = false;
                                flushbar(
                                    (widget.category != null)
                                        ? 'Edit Event gagal, silahkan mencoba kembali'
                                        : 'Menambahkan Event gagal, silahkan mencoba kembali',
                                    context);
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  )
                : loading(4.0)
          ],
        ),
      ),
    );
  }
}
