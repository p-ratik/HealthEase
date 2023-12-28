//
//  LoadingView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 09/08/23.
//

import SwiftUI

struct LoadingView: View {
    var color: Color
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: color))
            .scaleEffect(2)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(color: Color.blue)
    }
}
