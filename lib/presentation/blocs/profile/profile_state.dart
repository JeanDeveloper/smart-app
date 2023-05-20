part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  final bool isDark;
  ProfileState(this.isDark);
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  ProfileInitial():super(false);
}

class DarkMode extends ProfileState{
  DarkMode() : super(true);
} 

class LightMode extends ProfileState{
  LightMode() : super(false);
}

class StoredMode extends ProfileState{
  StoredMode(isDark):super(isDark);
}
