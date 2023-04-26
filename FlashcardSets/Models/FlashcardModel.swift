//
//  SetModel.swift
//  FlashcardSets
//
//  Created by Mirmukhammad Mirsodikov on 4/24/23.
//

import Foundation

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
  
  init(name: String, flashcards: [Flashcard]) {
    self.name = name
    self.flashcards = flashcards
    self.numberOfTimesStudied = 0
  }
}

let testFlashcardSetData: [FlashcardSet] = [
  FlashcardSet(
    name: "Leaders",
    flashcards: [
      Flashcard(term: "Adolf Hitler", definition: "Führer of Germany"),
      Flashcard(term: "Benito Musolini", definition: "Leader of Italy")
    ]
  ),
  FlashcardSet(
    name: "German",
    flashcards: [
      Flashcard(term: "Groß", definition: "Tall/Large"),
      Flashcard(term: "Über", definition: "Over")
    ]
  ),
  FlashcardSet(
    name: "Countries and Capitols",
    flashcards: [
      Flashcard(term: "Russia", definition: "Moscow"),
      Flashcard(term: "Ukraine", definition: "Kiev")
    ]
  ),
]
