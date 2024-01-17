part of 'translator_bloc.dart';

@immutable
abstract class TranslatorState {}

class TranslatorInitial extends TranslatorState {}

class TranslatorBlocLoading extends TranslatorState {}

class TranslatorBlocLoaded extends TranslatorState {}

class TranslatorBlocError extends TranslatorState {}
