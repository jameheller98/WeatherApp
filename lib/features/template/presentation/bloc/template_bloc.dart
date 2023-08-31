import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'template_event.dart';
part 'template_state.dart';

class CounterBloc extends Bloc<TemplateEvent, TemplateState> {
  CounterBloc() : super(TemplateState());
}
