import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:himatif_event/models/models.dart';
import 'package:himatif_event/services/services.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> addCategory(CategoryEvent category) async {
    ApiReturnValue result = await CategoryServicesApi.addCategory(category);
    if (result.value != null) {
      // await NotifikasiServices.sendAndRetrieveMessage(
      //     'Berhasil Ditambahkan', 'Category baru berhasil ditambahkan',
      //     topic: 'mahasiswa');
      emit(CategoryLoaded(
          (state as CategoryLoaded).listCategory + [result.value]));
    } else {
      emit(CategoryFailed(result.message));
    }
  }

  Future<void> getListCategory() async {
    ApiReturnValue result = await CategoryServicesApi.getEvent();
    if (result.value != null) {
      emit(CategoryLoaded([CategoryEvent(name: 'Semua')] + result.value));
    } else {
      emit(CategoryFailed(result.message));
    }
  }

  Future<void> updateCategory(CategoryEvent category) async {
    ApiReturnValue<CategoryEvent> result =
        await CategoryServicesApi.updateCategory(category);

    if (result.value != null) {
      List<CategoryEvent> listCategory =
          (state as CategoryLoaded).listCategory.map((value) {
        if (category.id == value?.id) {
          print('masuk 1');
          return result.value;
        } else {
          print('masuk 2');
          return value;
        }
      }).toList();
      // await NotifikasiServices.sendAndRetrieveMessage(
      //     'Berhasil Diupdate', 'Category berhasil diupdate',
      //     topic: 'mahasiswa');

      emit(CategoryLoaded(listCategory));
    } else {
      emit(CategoryFailed(result.message));
    }
  }

  Future<void> deleteCategory(int id) async {
    ApiReturnValue result = await CategoryServicesApi.deleteCategory(id);

    if (result.value != null) {
      List<CategoryEvent> listCategory = (state as CategoryLoaded)
          .listCategory
          .where((element) => element.id != id)
          .toList();
      // await NotifikasiServices.sendAndRetrieveMessage(
      //     'Berhasil Dihapus', 'Category dihapus',
      //     topic: 'mahasiswa');

      emit(CategoryLoaded(listCategory));
    } else {
      emit(CategoryFailed(result.message));
    }
  }

  void selectedCategory(String category) {
    print('selected');
    emit(CategoryLoaded((state as CategoryLoaded).listCategory,
        category: category));
  }
}
