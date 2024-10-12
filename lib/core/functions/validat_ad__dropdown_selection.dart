bool validateSelections(
    String? selectedCity, Map<int, String?> selectedOptions) {
  // Check if the selected city is null or empty
  if (selectedCity == null || selectedCity.isEmpty) {
    return false; // City selection is required
  }

  // Check if all attribute dropdowns have valid selections
  for (var option in selectedOptions.values) {
    if (option == null || option.isEmpty) {
      return false; // At least one attribute dropdown is not selected
    }
  }

  return true; // All selections are valid
}
