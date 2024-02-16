class ScannerEvents {}

class BarEvent extends ScannerEvents {}

class SetOption extends ScannerEvents {
  int? index;

  SetOption({this.index});
}
