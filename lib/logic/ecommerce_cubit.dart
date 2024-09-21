import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasking/data/online/repo.dart';
import 'package:tasking/logic/model/ecommerce-model.dart';

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
