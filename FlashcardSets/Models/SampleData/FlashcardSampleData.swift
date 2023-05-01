//
//  Flashcards.swift
//  FlashcardSets
//
//  Created by Mirmukhammad Mirsodikov on 4/26/23.
//

import Foundation


private let hiraganaFlashcards = FlashcardSet(
  name: "Hiragana",
  flashcards: [
    Flashcard(term: "あ", definition: "a"),
    Flashcard(term: "い", definition: "i"),
    Flashcard(term: "う", definition: "u"),
    Flashcard(term: "え", definition: "e"),
    Flashcard(term: "お", definition: "o"),
    Flashcard(term: "か", definition: "ka"),
    Flashcard(term: "き", definition: "ki"),
    Flashcard(term: "く", definition: "ku"),
    Flashcard(term: "け", definition: "ke"),
    Flashcard(term: "こ", definition: "ko"),
    Flashcard(term: "さ", definition: "sa"),
    Flashcard(term: "し", definition: "shi"),
    Flashcard(term: "す", definition: "su"),
    Flashcard(term: "せ", definition: "se"),
    Flashcard(term: "そ", definition: "so"),
    Flashcard(term: "た", definition: "ta"),
    Flashcard(term: "ち", definition: "chi"),
    Flashcard(term: "つ", definition: "tsu"),
    Flashcard(term: "て", definition: "te"),
    Flashcard(term: "と", definition: "to"),
    Flashcard(term: "な", definition: "na"),
    Flashcard(term: "に", definition: "ni"),
    Flashcard(term: "ぬ", definition: "nu"),
    Flashcard(term: "ね", definition: "ne"),
    Flashcard(term: "の", definition: "no"),
    Flashcard(term: "は", definition: "ha"),
    Flashcard(term: "ひ", definition: "hi"),
    Flashcard(term: "ふ", definition: "fu"),
    Flashcard(term: "へ", definition: "he"),
    Flashcard(term: "ほ", definition: "ho"),
    Flashcard(term: "ま", definition: "ma"),
    Flashcard(term: "み", definition: "mi"),
    Flashcard(term: "む", definition: "mu"),
    Flashcard(term: "め", definition: "me"),
    Flashcard(term: "も", definition: "mo"),
    Flashcard(term: "ら", definition: "ra"),
    Flashcard(term: "り", definition: "ri"),
    Flashcard(term: "る", definition: "ru"),
    Flashcard(term: "れ", definition: "re"),
    Flashcard(term: "ろ", definition: "ro"),
    Flashcard(term: "や", definition: "ya"),
    Flashcard(term: "ゆ", definition: "yu"),
    Flashcard(term: "よ", definition: "yo"),
    Flashcard(term: "わ", definition: "wa"),
    Flashcard(term: "を", definition: "o"),
    Flashcard(term: "ん", definition: "n")
  ]
)

let sampleFlashcardSets: [FlashcardSet] = [
  hiraganaFlashcards,
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
