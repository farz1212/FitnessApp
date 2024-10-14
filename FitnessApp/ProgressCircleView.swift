//
//  ProgressCircleView.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-14.
//

import SwiftUI

struct ProgressCircleView: View {
    var goal: Int
    var color: Color
    private let width: CGFloat = 20
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.4), lineWidth: width)
            Circle()
                .trim(from: 0, to: CGFloat(progress)/CGFloat(goal))
                .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
            .rotationEffect(.degrees(-90))
            .shadow(radius: 5)
        }
    }
}

#Preview {
    ProgressCircleView(goal: 100, color: .red, progress: .constant(50))
}
