//
//  Graph1.swift
//  social-apple
//
//  Created by Daniel Kravec on 2023-05-01.
//

import SwiftUI
import Charts

struct Graph1: View {
    @State var analytics: [AnalyticTrendDataPoint]?

    var body: some View {
        VStack {
            Text("Graph1")

            Chart {
                ForEach(analytics!) { analytic in
                    BarMark(
                        x: .value("erf", 3),
                        y: .value("ef", 4)
                    )
                }
            }
        }
    }
}

struct Graph1_Previews: PreviewProvider {
    static var previews: some View {
        Graph1()
    }
}
