//
//  ContentView.swift
//  NavigationDemo
//
//  Created by Matt Jarjoura on 7/28/23.
//

import SwiftUI

// workaround for extra safearea inset
private let SAFEAREA_INSET = -32.0

struct ChildView: View {
  var body: some View {
    GeometryReader { proxy in
      ScrollView {
        Text("I am the child")
          .frame(maxWidth: .infinity)
          .padding()
      }
      .background(Color(uiColor: .systemBackground))
      .frame(width: proxy.size.width, height: proxy.size.height)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button(action: {}, label: {
            Image(systemName: "gearshape.fill")
          })
        }
      }
      .toolbarBackground(.hidden, for: .navigationBar)
    }
    .safeAreaInset(edge: .top, spacing: SAFEAREA_INSET) {
      HStack(alignment: .center) {
        Text("Child")
          .font(.body.bold())
          .padding(.bottom, 8.0)
          .frame(maxWidth: .infinity)
      }
      .background(.thinMaterial)
      .offset(CGSize(width: 0, height: SAFEAREA_INSET))
    }
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
      .navigationTitle("")
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Home")
            .font(.body.bold())
        }
      }
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  ContentView()
}
