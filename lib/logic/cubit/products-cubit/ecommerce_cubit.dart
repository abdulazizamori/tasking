import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/ecommerce-model.dart';
import '../../../data/repo/products-repo/repo.dart';

part 'ecommerce_state.dart';

class EcommerceCubit extends Cubit<EcommerceState> {
  EcommerceModel? Ecomodel;
  final Repotisory repotisory;
  EcommerceCubit(this.repotisory) : super(EcommerceInitial());

  Future<void>? getEcommerceData() async{
    try{
      return repotisory.getAllData().then((value){
        if(value!.data != null){
          Ecomodel = EcommerceModel.fromJson(value.data);
          emit(EcommerceLoaded());
        }
      });


    }catch(e){
      print("Error--------> $e");
    }
  }
}
