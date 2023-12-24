//  /*
//
//  Project: TimelineView
//  File: TimelineView.swift
//  Created by: Elaidzha Shchukin
//  Date: 23.12.2023
//
//  */

import SwiftUI

struct TimelineView: View {
    var body: some View {
        
        VStack {
            TimelineView(.animation) { context in
                Text("\(context.date)")
                
                let seconds = Calendar.current.component(.second, from: context.date)
                Text("\(seconds)")
                
                Ellipse()
                    .frame(
                        width: seconds < 10 ? 50 : seconds < 30 ? 200 : 300,
                        height: 100
                    )
                    .animation(.bouncy, value: seconds)
            }
        }
    }
}

#Preview {
    TimelineView()
}
