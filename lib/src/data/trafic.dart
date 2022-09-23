import 'package:quiver/strings.dart';

class Trafic {
  final lines = <Lines>[]; 

  void addTrafic(String id, String name, int severity, List currentTraffic, List currentWork, List futureWork) {
    
    var line = Lines(id, name, severity, currentTraffic, currentWork, futureWork);

    lines.add(line);
  }

  void clear(){
    lines.clear();
  }

  Lines getLines(name) {
    for (var line in lines) {
      if (line.name == name) return line;
    }
    return lines[0];
  }

  Lines getLinesCurrentTrafic(name) {
    for (var line in lines) {
      if (line.name == name) return line;
    }
    return lines[0];
  }

  bool isEmpty() {
    if (lines.length == 0) return true;
    else return false;
  }

  List<Lines> getAllLines() {
    return lines;
  }

}

class Lines {
  final String id;
  final String name;
  final int severity;
  final List currentTraffic;
  final List currentWork;
  final List futureWork;

  Lines(this.id, this.name, this.severity, this.currentTraffic, this.currentWork, this.futureWork);
}

final TRAFIC = Trafic();