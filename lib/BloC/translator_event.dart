part of 'translator_bloc.dart';

@immutable
abstract class TranslatorEvent {}
class FetchTranslator extends TranslatorEvent{
  final String text;
    FetchTranslator({required this .text});
}