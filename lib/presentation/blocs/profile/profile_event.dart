part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];

}

class ChangeMode extends ProfileEvent{
  final bool isDark;
  ChangeMode(this.isDark);
}

class GetModeStorage extends ProfileEvent{}




