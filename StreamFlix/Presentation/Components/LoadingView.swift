//
//  LoadingView.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {

        VStack(spacing: 25) {

            ProgressView()
                .scaleEffect(1.5)

            Text("Loading StreamFlix...")
                .font(.title2)
        }
    }
}
