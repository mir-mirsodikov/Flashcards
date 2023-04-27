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
  
  func flipCard() {
    isFlipped = !isFlipped
    if isFlipped {
      withAnimation(.linear(duration: durationAndDelay)) {
        backDegree = 90
      }
      withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
        frontDegree = 0
      }
    } else {
      withAnimation(.linear(duration: durationAndDelay)) {
        frontDegree = -90
      }
      withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
        backDegree = 0
      }
    }
    
  }
  
  var body: some View {
    if !finished {
      VStack {
        ProgressView(value: progression) {
          Text("Progress")
        }
        .padding()
        Spacer()
        ZStack {
          CardFront(width: width, height: height, text: flashcards[currentIndex].term, degree: $frontDegree)
          CardBack(width: width, height: height, text: flashcards[currentIndex].definition, degree: $backDegree)
        }
        .onTapGesture {
          flipCard()
        }
        .transition(.slide)
        
        Spacer()
        Button {
          if currentIndex + 1 != flashcards.count {
            withAnimation(.linear) {
              if isFlipped {
                flipCard()
              }
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

struct CardFront: View {
  let width: CGFloat
  let height: CGFloat
  let text: String
  @Binding var degree: Double
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .fill(.white)
        .frame(width: width, height: height)
        .shadow(color: .gray, radius: 2, x: 0, y: 0)
      
      Text(text)
    }
    .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y: 0, z: 0))
  }
}

struct CardBack: View {
  let width: CGFloat
  let height: CGFloat
  let text: String
  @Binding var degree: Double
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .stroke(.blue.opacity(0.7), lineWidth: 2)
        .frame(width: width, height: height)
      
      Text(text)
    }
    .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y: 0, z: 0))
  }
}

struct Study_Previews: PreviewProvider {
  static var previews: some View {
    Study(flashcards: testFlashcardSetData[0].flashcards)
  }
}
