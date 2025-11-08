part of 'get_by_id_bloc.dart';

@immutable
abstract class GetByIdEvent extends Equatable{
  final int id;
  GetByIdEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
