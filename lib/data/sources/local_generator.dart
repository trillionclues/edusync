import 'dart:math';

/// local generator for random habit titles.
class LocalHabitGenerator {
  static const List<String> _habitTitles = [
    'Drink 8 glasses of water',
    'Read for 20 minutes',
    'Do 10 push-ups',
    'Meditate for 5 minutes',
    'Write in journal',
    'Take a 15-minute walk',
    'Practice gratitude',
    'Eat a healthy breakfast',
    'Stretch for 10 minutes',
    'Call a friend or family member',
    'Listen to a podcast',
    'Do a random act of kindness',
    'Organize one small area',
    'Take deep breaths for 2 minutes',
    'Learn something new',
    'Avoid social media for 1 hour',
    'Eat a piece of fruit',
    'Make your bed',
    'Plan tomorrow\'s priorities',
    'Practice a hobby for 15 minutes',
  ];

  static final Random _random = Random();

  static String generateRandomHabitTitle() {
    return _habitTitles[_random.nextInt(_habitTitles.length)];
  }
}
