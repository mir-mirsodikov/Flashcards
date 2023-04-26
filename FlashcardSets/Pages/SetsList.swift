//
//  SetsList.swift
//  FlashcardSets
//
//  Created by Mirmukhammad Mirsodikov on 4/24/23.
//

import SwiftUI

struct SetsList: View {
  @State var sets: [FlashcardSet]
  
  var body: some View {
    VStack {
      List {
        Section {
          NavigationLink {
            Text("Create new set")
              .navigationTitle("New Set")
              .navigationBarTitleDisplayMode(.inline)
          } label: {
            Text("Create new set")
              .foregroundColor(.accentColor)
          }
          .buttonStyle(.bordered)
        }
        ForEach($sets, editActions: [.delete, .move]) { $set in
          NavigationLink {
            SetDetails(setDetails: $set)
              .background(Color(hex: 0xf0f0f6))
              .toolbarRole(.editor)
          } label: {
            Text(set.name)
          }
          .swipeActions(edge: .trailing) {
            Button("Edit") {
              
            }
            .tint(.blue)
            
            Button(role: .destructive) {
              
            } label: {
              Label("Delete", systemImage: "trash.fill")
            }
          }
        }
      }
    }
    .toolbar { EditButton() }
    .navigationTitle("Flashcard Sets")
    
  }
}

struct SetsList_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      SetsList(sets: testFlashcardSetData)
    }
  }
}
