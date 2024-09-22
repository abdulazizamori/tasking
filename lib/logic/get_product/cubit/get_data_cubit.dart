import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasking/data/online/repo.dart';
import 'package:tasking/logic/model/ecommerce-model.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit(this.repotisory) : super(GetDataInitial());
  EcommerceModel? dataModel;
  final Repotisory repotisory;

  Future<void>? getDataStore() async {
    try {
      return repotisory.getAllData().then((value) {
        if (value!.data != null) {
          dataModel = EcommerceModel.fromJson(value.data);
          emit(GetDataSucess());
        }
      });
    } catch (e) {
      print("Error Get Data ---------------> $e");
    }
  }
}
