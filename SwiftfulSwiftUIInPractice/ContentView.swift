//
//  ContentView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    var body: some View {
        ScrollView {
            VStack {
                ForEach(users) { user in
                    Text(user.firstName)
                }
            }
        }
        .task {
            do {
                users = try await DatabaseHelper().getUser()
            } catch {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
