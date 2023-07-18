String toKeyForMap(dynamic name, dynamic lastName) {
  return name.toString().trim().toLowerCase() +
      lastName.toString().trim().toLowerCase();
}
