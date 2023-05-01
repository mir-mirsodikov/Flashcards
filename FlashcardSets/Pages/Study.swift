//
//  Study.swift
//  FlashcardSets
//
//  Created by Mirmukhammad Mirsodikov on 4/26/23.
//

import SwiftUI

struct Study: View {
  @Environment(\.dismiss) var dismiss
  var flashcards: [Flashcard]
  @State var currentIndex = 0
  @State var progression: Double
  @State var finished: Bool = false
  
  @State var backDegree = 0.0
  @State var frontDegree = -90.0
  @State var isFlipped = false
  
  let height: CGFloat = 250
  let width: CGFloat = 250
  let durationAndDelay: CGFloat = 0.1
  
  init(flashcards: [Flashcard]) {
    self.flashcards = flashcards
    _progression = State(initialValue: 1.0 / Double(flashcards.count))
  }
  
  var body: some View {
    if !finished {
      VStack {
        ProgressView(value: progression) {
          Text("Progress")
        }
        .padding()
        Spacer()
        
        CardView(card: flashcards[currentIndex], currentIndex: currentIndex)
        
        Spacer()
        Button {
          if currentIndex + 1 != flashcards.count {
            withAnimation(.linear) {
              currentIndex += 1
            }
          } else {
            finished.toggle()
          }
          withAnimation(.linear) {
            progression = Double(currentIndex + 1) / Double(flashcards.count)
          }
        } label: {
          Text("Next")
            .frame(width: 200)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .font(.title2)
      }
    } else {
      finishScreen
    }
  }
  
  @ViewBuilder
  var finishScreen: some View {
    Button("Finish") {
      dismiss()
    }
    .buttonStyle(.borderedProminent)
    .controlSize(.large)
    .font(.title2)
    .tint(progression == 1.0 ? .green : .blue)
  }
}

struct Study_Previews: PreviewProvider {
  static var previews: some View {
    Study(flashcards: sampleFlashcardSets[0].flashcards)
  }
}
