////
////  CardView.swift
////  FlashcardSets
////
////  Created by Mirmukhammad Mirsodikov on 4/26/23.
////
//
import SwiftUI


struct CardView: View {
  var card: Flashcard
  var currentIndex: Int

  @State var frontDegree = 0.0
  @State var backDegree = -90.0
  @State var isFlipped = false

  let height: CGFloat = 250
  let width: CGFloat = 300
  let durationAndDelay: CGFloat = 0.2

  func flipCard() {
    isFlipped = !isFlipped
    if isFlipped {
      withAnimation(.linear(duration: durationAndDelay)) {
        frontDegree = 90
      }
      withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
        backDegree = 0
      }
    } else {
      withAnimation(.linear(duration: durationAndDelay)) {
        backDegree = -90
      }
      withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
        frontDegree = 0
      }
    }
  }

  var body: some View {
    ZStack {
      CardFront(width: width, height: height, text: card.term, degree: $frontDegree)
      CardBack(width: width, height: height, text: card.definition, degree: $backDegree)
    }
    .onTapGesture {
      flipCard()
    }
//    .offset(x: -500)
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(card: sampleFlashcardSets[0].flashcards[0], currentIndex: 0 )
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
        .font(.title)
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

