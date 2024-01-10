
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Param {
  int? selectedIndex;

  Param({this.selectedIndex});
}

// 창고데이터
class ParamStore extends Param {

  void setSelectedIndex(int selectedIndex){
    this.selectedIndex = selectedIndex;
  }

}

final paramProvider = Provider<ParamStore>((ref) {
  return ParamStore();
});
