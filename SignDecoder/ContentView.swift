//
//  ContentView.swift
//  SignDecoder
//
//  Created by Sneha on 26/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 50) {
                Text("Tap to select a sign to translate")
                    .font(.headline)
                
                ImageGalleryView()
                Spacer()
            }
            .trailTheme()
            .navigationTitle("Sign Decoder")
        }
    }
}


#Preview {
    ContentView()
}
