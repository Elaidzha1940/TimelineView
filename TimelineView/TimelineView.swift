//  /*
//
//  Project: TimelineView
//  File: TimelineViewView.swift
//  Created by: Elaidzha Shchukin
//  Date: 23.12.2023
//
//  */

import SwiftUI

struct TimelineViewView: View {
    @State private var startTime: Date = .now
    @State private var pauseAnimation: Bool = false
    
    var body: some View {
        
        VStack {
            TimelineView(.animation(minimumInterval: 0.3, paused: pauseAnimation)) { context in
                
                Text("\(context.date)")
                Text("\(context.date.timeIntervalSince1970)")
                
                //let seconds = Calendar.current.component(.second, from: context.date)
                
                let seconds = context.date.timeIntervalSince(startTime)
                Text("\(seconds)")
                
                if context.cadence == .live {
                    Text("Cadence: Live")
                } else if context.cadence == .minutes {
                    Text("Cadence: Minutes")
                } else if context.cadence == .seconds {
                    Text("Cadence: Seconds")
                }
                
                Ellipse()
                    .foregroundColor(.white)
                    .frame(
                        width: seconds < 5 ? 10 : seconds < 15 ? 25 : 50,
                        height: 100
                    )
                    .animation(.bouncy, value: seconds)
            }
            Button(pauseAnimation ? "Play" : "Pause") {
                pauseAnimation.toggle()
            }
            .foregroundColor(.white)
            .padding()
            .frame(height: 50)
            .background(Color.black)
            .cornerRadius(15)
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
    }
}

#Preview {
    TimelineViewView()
}

