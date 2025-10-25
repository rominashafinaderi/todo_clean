part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent extends Equatable{
  final int id;
  DetailEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
