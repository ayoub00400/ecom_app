import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_cart_state.dart';

class UserCartCubit extends Cubit<UserCartState> {
  UserCartCubit() : super(UserCartInitial());
}
