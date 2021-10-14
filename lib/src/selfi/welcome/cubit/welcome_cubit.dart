import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());

  bool btnActive = false;

  void btnPulse(bool active) {
    btnActive = active;
    emit(WelcomeBtnPulse(active));
  }

  void accepted() {
    emit(WelcomeAccepted());
  }

  void gotoPicture() {
    emit(WelcomeGoTo());
  }
}
