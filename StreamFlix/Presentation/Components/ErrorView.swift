//
//  ErrorView.swift
//  StreamFlix
//
//  Created by Fayith  on 25/08/26.
//
import SwiftUI

struct ErrorView: View {

    let message: String
    let retry: () -> Void

    var body: some View {

        VStack(spacing: 25) {

            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 60))

            Text("Unable to Load Catalog")
                .font(.title)

            Text(message)
                .foregroundStyle(.secondary)

            Button("Retry") {
                print("RETRY")
                retry()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
