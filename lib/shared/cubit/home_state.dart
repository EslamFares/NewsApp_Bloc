abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeChangeBottomNavState extends HomeStates {}

class NewsGetBusinessLoadingState extends HomeStates {}

class NewsGetBusinessSuccessState extends HomeStates {}

class NewsGetBusinessErrorState extends HomeStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends HomeStates {}

class NewsGetSportsSuccessState extends HomeStates {}

class NewsGetSportsErrorState extends HomeStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends HomeStates {}

class NewsGetScienceSuccessState extends HomeStates {}

class NewsGetScienceErrorState extends HomeStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoadingState extends HomeStates {}

class NewsGetSearchSuccessState extends HomeStates {}

class NewsGetSearchErrorState extends HomeStates {
  final String error;
  NewsGetSearchErrorState(this.error);
}

class ChangeThemeState extends HomeStates {}
