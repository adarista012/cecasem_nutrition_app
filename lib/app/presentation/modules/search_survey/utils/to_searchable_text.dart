String toSearcheableText(String str) {
  return str.toLowerCase().replaceAll(r' ', '').trim();
}
