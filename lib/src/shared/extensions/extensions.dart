// Import the dart:core library to use the String class
import 'dart:core';

extension ExtendedString on String {
  String get titleCase {
    if (this.isEmpty) return ''; // Handle empty string
    final words = this.split(' ');
    // Capitalize the first letter of each word and join them back
    return words.map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  String get abbreviation {
    if (this.isEmpty) return ''; // Handle empty string
    final words = this.split(' ');
    // Capitalize the first letter of each word and join them back
    return words.map((word) {
      if (word.isEmpty) return '';
      return word[0];
    }).join(' ').toUpperCase();
  }
}
