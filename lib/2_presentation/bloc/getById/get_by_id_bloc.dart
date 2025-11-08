import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'get_by_id_event.dart';
part 'get_by_id_state.dart';

class GetByIdBloc extends Bloc<GetByIdEvent, GetByIdState> {
  GetByIdBloc() : super(GetByIdInitial()) {
    on<GetByIdEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
