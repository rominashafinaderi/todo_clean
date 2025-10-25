part of 'delete_bloc.dart';

 class DeleteEvent extends Equatable {
  final int id;
  const DeleteEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
