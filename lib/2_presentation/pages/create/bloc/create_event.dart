part of 'create_bloc.dart';

 class CreateEvent extends Equatable {
  final int userId;
  final String title;
  final bool completed;

  const CreateEvent({required this.userId, required this.title, required this.completed});

  @override
  List<Object?> get props => [userId, title, completed];
}
