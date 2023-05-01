//
//  SetModel.swift
//  FlashcardSets
//
//  Created by Mirmukhammad Mirsodikov on 4/24/23.
//

import Foundation

/// A model to represent a singular flashcard entity
struct Flashcard: Identifiable {
  let id = UUID()
  var term: String
  var definition: String
}

struct FlashcardSet: Identifiable {
  let id = UUID()
  var name: String
  var flashcards: [Flashcard]
  var numberOfTimesStudied: Int
  
  /// Create a new flashcard set
  /// - Parameters:
  ///   - name: Name of the set
  ///   - flashcards: Flashcards within the set
  init(name: String, flashcards: [Flashcard]) {
    self.name = name
    self.flashcards = flashcards
    self.numberOfTimesStudied = 0
  }
}

