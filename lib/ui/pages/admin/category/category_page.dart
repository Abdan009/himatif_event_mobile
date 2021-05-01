part of '../../pages.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Daftar Kategori'),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(() => UpdateCategory());
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: mainColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (_, categoryState) {
          if (categoryState is CategoryLoaded) {
            List<CategoryEvent> listCategory = categoryState.listCategory;
            return (listCategory.isNotEmpty)
                ? ListView.builder(
                    itemCount: listCategory.length,
                    itemBuilder: (_, index) {
                      return Container(
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(() => UpdateCategory(
                                    category: listCategory[index],
                                  ));
                            },
                            title: Text(listCategory[index].name),
                            dense: true,
                            trailing: GestureDetector(
                                onTap: () {
                                  context
                                      .read<CategoryCubit>()
                                      .deleteCategory(listCategory[index].id);
                                },
                                child: Icon(Icons.delete, color: Colors.red)),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('Kategori Kosong', style: blackTextFont),
                  );
          } else {
            return Center(
              child: loading(4.0),
            );
          }
        }),
      ),
    );
  }
}
