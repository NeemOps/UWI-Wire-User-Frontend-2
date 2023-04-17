import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'metamask_state.dart';

class MetamaskCubit extends Cubit<MetamaskState> {
  MetamaskCubit() : super(MetamaskInitial());

  Future<void> connect() async {}
}
