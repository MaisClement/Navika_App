class NavState {
  final nav = <Nav>[]; 

  int addNav(String stopArea, String stopName) {
    var navs = Nav(stopArea, stopName);
    nav.add(navs);
    return nav.length - 1;
  }

  void clear(){
    nav.clear();
  }

  bool isEmpty() {
    if (nav.length == 0) return true;
    else return false;
  }

  List<Nav> getAllNav() {
    return nav;
  }

  Nav getNavById(id) {
    return nav[id];
  }

}

class Nav {
  final String stopArea;
  final String stopName;

  Nav(this.stopArea, this.stopName);
}

final NAVSTATE = NavState();