import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'take_picture_state.dart';

class TakePictureCubit extends Cubit<TakePictureState> {
  TakePictureCubit() : super(TakePictureInitial());
}
