//
//  FlashcardSetsApp.swift
//  FlashcardSets
//
//  Created by Mirmukhammad Mirsodikov on 4/24/23.
//

import SwiftUI

@main
struct FlashcardSetsApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      SetsList(sets: testFlashcardSetData)
        .background(Color(hex: 0xf0f0f6))
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
