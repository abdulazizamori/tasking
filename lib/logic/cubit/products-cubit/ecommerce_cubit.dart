import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../data/model/ecommerce-model.dart';
import '../../../data/repo/repo.dart';

part 'ecommerce_state.dart';

class EcommerceCubit extends Cubit<EcommerceState> {
  List<EcommerceModel>? Ecomodel;
  final Repository repotisory;
  EcommerceCubit(this.repotisory) : super(EcommerceInitial());

  Future<void>? getEcommerceData() async {
    try {
      final value = await repotisory.getAllData();
      return repotisory.getAllData().then((value) {
        if (value != null && value.data != null) {
          Ecomodel = EcommerceModel.listFromJson(value.data);
          emit(EcommerceLoaded());
        }
      });
    } catch (e) {
      print("Error--------> $e");
    }
  }
}
