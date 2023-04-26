//
//  SetDetails.swift
//  FlashcardSets
//
//  Created by Mirmukhammad Mirsodikov on 4/24/23.
//

import SwiftUI

struct SetDetails: View {
  @Binding var setDetails: FlashcardSet
  
  var body: some View {
    VStack {
      ScrollView {
        HStack {
          VStack(alignment: .leading) {
//            Text(setDetails.name)
//              .font(.title)
            
            Text("Number of times studied: \(setDetails.numberOfTimesStudied)")
          }
          .padding([.leading], 20)
          Spacer()
        }
        
        ForEach($setDetails.flashcards) { $flashcard in
          VStack(alignment: .leading) {
            Text(flashcard.term)
            Divider()
            Text(flashcard.definition)
          }
          .padding(16)
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(Color.gray, lineWidth: 2)
          }
          .background(Color.white)
          .cornerRadius(12)
          .padding([.horizontal], 20)
          .padding([.vertical], 6)
        }
        Spacer()
      }
      VStack {
        Button("Begin Studying") {
          
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .font(.title3)
        .fontWeight(Font.Weight.bold)
      }
    }
    .navigationTitle(setDetails.name)
  }
}

struct SetDetails_Previews: PreviewProvider {
  @State static var flashcards = testFlashcardSetData[0]
  
  static var previews: some View {
    NavigationStack {
      SetDetails(setDetails: $flashcards)
        .background(Color(hex: 0xf0f0f6))
    }
  }
}
