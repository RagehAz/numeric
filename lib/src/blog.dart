/// TESTED : WORKS PERFECT
void blog(dynamic msg, {String invoker}){

  assert((){
    // log(msg.toString());
    // ignore: avoid_print
    print(msg?.toString());
    return true;
  }(), '_');

  /// NOUR IDEA
  /*
    extension Printer on dynamic {
      void log() {
        return dev.log(toString());
      }
    }
     */

}
