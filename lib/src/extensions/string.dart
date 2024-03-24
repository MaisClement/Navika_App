extension StringCasingExtension on String {
  String capitalize() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String titleCapitalize() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize()).join(' ');
}