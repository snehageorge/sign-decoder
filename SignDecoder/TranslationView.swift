//
//  TranslationView.swift
//  SignDecoder
//
//  Created by Sneha on 26/06/25.
//

import SwiftUI
import Translation

struct TranslationView: View {
    var text: String
    var isProcessing: Bool
    @State private var showingTranslation: Bool = false
    
    var body: some View {
        VStack {
            Text("Identified Text")
                .textCase(.uppercase)
                .foregroundStyle(Color.gray)
                .font(.subheadline.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                .padding()
                .font(.subheadline)
                .background(Color.gray.opacity(0.2))
                .overlay {
                    if isProcessing {
                        ProgressView()
                    }
                }
                .translationPresentation(
                    isPresented: $showingTranslation,
                    text: text
                )
            
            Button {
                showingTranslation = true
            } label: {
                Text("Translate")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8))
            }
            .disabled(text.isEmpty)
            .padding(.top)
        }
    }
}

#Preview {
    TranslationView(text: "Caution, falling rocks", isProcessing: false)
}
