import 'dart:math';

import 'package:flutter/material.dart';

class PasswordGeneratorWidget extends StatefulWidget {
  const PasswordGeneratorWidget({super.key});

  @override
  PasswordGeneratorWidgetState createState() => PasswordGeneratorWidgetState();
}

class PasswordGeneratorWidgetState extends State<PasswordGeneratorWidget> {
  int passwordLength = 12;
  bool includeUppercase = true;
  bool includeLowercase = true;
  bool includeNumbers = true;
  bool includeSpecialCharacters = true;
  String generatedPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Password length slider
            Slider(
              value: passwordLength.toDouble(),
              min: 8,
              max: 20,
              onChanged: (value) {
                setState(() {
                  passwordLength = value.round();
                });
              },
            ),
            Text('Password Length: $passwordLength'),
            // Checkboxes for character types
            CheckboxListTile(
              title: const Text('Include Uppercase'),
              value: includeUppercase,
              onChanged: (value) {
                setState(() {
                  includeUppercase = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Include Lowercase'),
              value: includeLowercase,
              onChanged: (value) {
                setState(() {
                  includeLowercase = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Include Numbers'),
              value: includeNumbers,
              onChanged: (value) {
                setState(() {
                  includeNumbers = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Include Special Characters'),
              value: includeSpecialCharacters,
              onChanged: (value) {
                setState(() {
                  includeSpecialCharacters = value!;
                });
              },
            ),
            // Generate password button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  generatedPassword = PasswordGenerator.generatePassword(
                    length: passwordLength,
                    includeUppercase: includeUppercase,
                    includeLowercase: includeLowercase,
                    includeNumbers: includeNumbers,
                    includeSpecialCharacters: includeSpecialCharacters,
                  );
                });
              },
              child: const Text('Generate Password'),
            ),
            // Display generated password
            const SizedBox(height: 16.0),
            Text('Generated Password: $generatedPassword'),
          ],
        ),
      ),
    );
  }
}

class PasswordGenerator {
  static String generatePassword({
    int length = 12,
    bool includeUppercase = true,
    bool includeLowercase = true,
    bool includeNumbers = true,
    bool includeSpecialCharacters = true,
  }) {
    final charSets = <String>[];
    if (includeUppercase) {
      charSets.add(r'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
    }
    if (includeLowercase) {
      charSets.add(r'abcdefghijklmnopqrstuvwxyz');
    }
    if (includeNumbers) {
      charSets.add(r'0123456789');
    }
    if (includeSpecialCharacters) {
      charSets.add(r'!@#$%^&*()_-+=<>?');
    }

    if (charSets.isEmpty) {
      throw ArgumentError('At least one character set must be selected.');
    }

    final random = Random.secure();
    final charPool = charSets.join();
    final password = List.generate(
        length, (index) => charPool[random.nextInt(charPool.length)]);
    return password.join();
  }
}
