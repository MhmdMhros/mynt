part of 'layout_cubit.dart';

sealed class LayoutState extends Equatable {
  const LayoutState();

  @override
  List<Object> get props => [];
}

final class LayoutInitial extends LayoutState {}

final class ChangeCurrentSelectedBottomNavIndex extends LayoutState {}

final class UpdateUserSuccess extends LayoutState {}

final class GetUserLoading extends LayoutState {}

final class GetUserSuccess extends LayoutState {}

final class GetUserFailure extends LayoutState {
  final String message;

  const GetUserFailure(this.message);
}

class SocketDataUpdated extends LayoutState {
  final dynamic data;
  const SocketDataUpdated(this.data);

  @override
  List<Object> get props => [data];
}
