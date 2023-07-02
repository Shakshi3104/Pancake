//
//  SummaryView.swift
//  Pancake
//
//  Created by MacBook Pro M1 on 2023/07/02.
//

import SwiftUI

// MARK: - SummaryView
struct SummaryView: View {
    var pancakesData: PancakesData
    @State private var showLineChartAverage = false
    @State private var showBarChartAverage = false
    
    var body: some View {
        VStack {
            // Title
            HStack {
                Text("Sales Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            // Measure summary
            HStack(spacing: 16) {
                let totalSales = pancakesData.dailySalesPerCategory.reduce(0) { $0 + $1.sales }
                let totalOrders = pancakesData.salesCategoryVsStore.reduce(0) { $0 + $1.sales }
                let meanUnit = Int(totalSales / totalOrders)
                
                MeasureSummary(
                    measureName: "Total Sales",
                    measureValue: totalSales
                )
                
                MeasureSummary(
                    measureName: "Total Orders",
                    measureValue: totalOrders
                )
                
                MeasureSummary(
                    measureName: "Average Unit",
                    measureValue: meanUnit
                )
            }
        }
    }
}

// MARK: - Preview
struct SummaryView_Preview: PreviewProvider {
    static var previews: some View {
        SummaryView(pancakesData: PancakesData())
    }
}
