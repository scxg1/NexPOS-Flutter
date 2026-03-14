part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Locale locale;
  const LanguageState({required this.locale});

  bool get isArabic => locale.languageCode == 'ar';

  @override
  List<Object?> get props => [locale];
}
