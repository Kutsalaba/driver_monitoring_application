import 'package:driver_monitoring_application/models/driver_model.dart';

String getStringCategories(DriverModel driver) {
  List<String> selectedCategories = [];

  if (driver.a1Category == true) {
    selectedCategories.add('A1');
  }

  if (driver.aCategory == true) {
    selectedCategories.add('A');
  }

  if (driver.b1Category == true) {
    selectedCategories.add('B1');
  }

  if (driver.bCategory == true) {
    selectedCategories.add('B');
  }

  if (driver.c1Category == true) {
    selectedCategories.add('C1');
  }

  if (driver.cCategoty == true) {
    selectedCategories.add('C');
  }

  if (driver.d1Categoty == true) {
    selectedCategories.add('D1');
  }

  if (driver.dCategory == true) {
    selectedCategories.add('D');
  }

  if (driver.c1eCategory == true) {
    selectedCategories.add('C1E');
  }

  if (driver.beCategory == true) {
    selectedCategories.add('BE');
  }

  if (driver.ceCategory == true) {
    selectedCategories.add('CE');
  }

  if (driver.d1eCategory == true) {
    selectedCategories.add('D1E');
  }

  if (driver.deCategory == true) {
    selectedCategories.add('DE');
  }

  return selectedCategories.join(', ');
}
