//
//  ContentView.swift
//  NavigationDemo
//
//  Created by Matt Jarjoura on 7/28/23.
//

import SwiftUI

struct ChildView: View {
  var body: some View {
    ScrollView {
      Text("I am the child")
    }
    .navigationTitle("Child")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(false)
  }
}

struct ContentView: View {
  @State var path: NavigationPath = .init()

  var body: some View {
    NavigationStack {
      List {
        NavigationLink {
          // Link here
          ChildView()
        } label: {
          Label(
            title: { Text("Link 1") },
            icon: { Image(systemName: "1.circle") }
          )
        }
        .frame(maxWidth: .infinity, alignment: .leading)

        NavigationLink {
          // Link Here
        } label: {
          Label(
            title: { Text("Link 2") },
            icon: { Image(systemName: "2.circle") }
          )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .navigationTitle("Home Screen")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  ContentView()
}
