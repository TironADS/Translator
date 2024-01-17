import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/Traslator_API.dart';
import '../Repository/Model_Class/TranslatorModel.dart';

part 'translator_event.dart';
part 'translator_state.dart';

class TranslatorBloc extends Bloc<TranslatorEvent, TranslatorState> {

  TranslatorApi translatorApi =TranslatorApi();
  late TranslatorModel translatorModel;


  TranslatorBloc() : super(TranslatorInitial()) {
    on<FetchTranslator>((event, emit) async {
     emit(TranslatorBlocLoading());
     try{
       translatorModel = await translatorApi.getTranslator(text: event.text );
       emit(TranslatorBlocLoaded());
     }catch(e){
       print(e);
       emit(TranslatorBlocError());
     }
    });
  }
}
