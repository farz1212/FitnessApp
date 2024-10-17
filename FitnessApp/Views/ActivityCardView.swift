//
//  ActivityCardView.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-14.
//

import SwiftUI

struct ActivityCardView: View {
    @State var activity: ActivityModel
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack{
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 7){
                        Text(activity.title)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        Text(activity.subtitle)
                            .font(.caption)
                    }
                    Spacer()
                    Image(systemName: activity.image)
                        .foregroundStyle(activity.tintColor)
                }
                Text(activity.amount)
                    .font(.title)
                    .bold()
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCardView(activity: ActivityModel(title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .green, amount: "9,542"))
}
