//
//  Category Manager.swift
//  TALPCARDS
//
//  Created by Taha Ilgar on 06.02.24.
//

import SwiftUI

struct CategoryManager: View {
    @State private var showCategoryAddSheet = false
    @State private var categories = [String]()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: "#8EDCE6"), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView { // Verwenden eines ScrollView, um sicherzustellen, dass der Inhalt scrollbar ist und sich anpasst.
                VStack {
                    Text("Select a Category")
                        .font(.title)
                        .foregroundColor(Color(hex: "#011f43"))
                        .padding()
                    
                    Button("Choose Category") {
                        showCategoryAddSheet = true
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color(hex: "#011f43"))
                    .cornerRadius(10)
                    .padding(.bottom)
                    
                    // Anzeigen der hinzugefügten Kategorien
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }

                    // Buttons "Edit", "Delete" hier horizontal anordnen
                    HStack {
                        Button("Edit") {
                            // Aktion für das Bearbeiten
                        }
                        .padding(.horizontal, 15.0) // Abstand zwischen den Buttons
                        
                        Button("Delete") {
                            // Aktion für das Löschen
                        }
                    }
                    .foregroundColor(Color(hex: "#011f43"))
                    .padding(.bottom)
                }
                .padding(.bottom, 50) // Zusätzlichen Abstand unten hinzufügen, falls benötigt
            }
        }
        .sheet(isPresented: $showCategoryAddSheet) {
            // Ansicht für das Hinzufügen einer neuen Kategorie
            CategoryAddView(categories: $categories)
        }
    }
}

// CategoryAddView bleibt unverändert


struct CategoryAddView: View {
    @Binding var categories: [String]
    @State private var newCategoryName = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Add New Category")
                .font(.headline)
            
            TextField("Category Name", text: $newCategoryName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Add") {
                guard !newCategoryName.isEmpty else { return }
                categories.append(newCategoryName)
                newCategoryName = "" // Textfeld zurücksetzen
            }
            .foregroundColor(Color.white)
            .padding()
            .background(Color(hex: "#011f43"))
            .cornerRadius(10)
        }
        .padding()
    }
}

struct CategoryManager_Previews: PreviewProvider {
    static var previews: some View {
        CategoryManager()
    }
}
