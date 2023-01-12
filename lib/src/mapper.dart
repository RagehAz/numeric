
class Mapper {

  const Mapper();

  /// TESTED : WORKS PERFECT
  static bool checkCanLoopList(List<dynamic> list) {
    bool _canLoop = false;

    if (list != null && list.isNotEmpty) {
      _canLoop = true;
    }
    return _canLoop;
  }

}
