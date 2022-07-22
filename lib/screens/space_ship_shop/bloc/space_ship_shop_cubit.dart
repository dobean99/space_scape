import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'space_ship_shop_state.dart';

class SpaceShipShopCubit extends Cubit<SpaceShipShopState> {
  SpaceShipShopCubit() : super(SpaceShipShopInitial());
}
