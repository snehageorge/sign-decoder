//
//  TextRecognitionView.swift
//  SignDecoder
//
//  Created by Sneha on 26/06/25.
//

import SwiftUI

struct TextRecognitionView: View {
    let imageResource: ImageResource
    let boundingColor = Color(red: 1.00, green: 0.00, blue: 0.85)
    @State private var textRecognizer: TextRecognizer?
    
    var body: some View {
        VStack {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .task {
                    textRecognizer = await TextRecognizer(
                        imageResource: imageResource
                    )
                }
                .overlay {
                    if let observations = textRecognizer?.observations {
                        ForEach(observations, id: \.uuid) { observation in
                            BoundsRect(normalizedRect: observation.boundingBox)
                                .stroke(
                                    observation.confidence < 1 ? Color.red : boundingColor,
                                    lineWidth: 3
                                )
                        }
                    }
                }
            
            Spacer()
            
            TranslationView(text: textRecognizer?.recognizedText ?? "", isProcessing: isProcessing)
        }
        .padding()
        .trailTheme()
        .navigationTitle("Sign Info")
    }
    private var isProcessing: Bool {
        textRecognizer == nil
    }
}

#Preview {
    NavigationStack {
        TextRecognitionView(imageResource: .sign1)
            .navigationBarTitleDisplayMode(.inline)
    }
}
