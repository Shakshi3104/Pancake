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
        VStack(spacing: 16) {
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
                
                Spacer()
            }
            
            // Charts
            HStack(spacing: 16) {
                LineChart(
                    salesAmount: pancakesData.dailySales,
                    chartTitle: "Daily Sales",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    showAverage: showLineChartAverage
                )
                .onTapGesture {
                    showLineChartAverage.toggle()
                }
                
                BarChartTranspose(
                    salesAmount: pancakesData.totalSalesPerCategory,
                    
                    chartTitle: "Total Sales per Topping",
                    xAxisLabel: "Sales",
                    yAxisLabel: "Topping",
                    legendTitle: "Topping"
                )
            }
            
            HStack(spacing: 16) {
                BarChart(
                    salesAmount: pancakesData.dailySalesPerCategory,
                    chartTitle: "Daily Sales per Topping",
                    xAxisLabel: "Date",
                    yAxisLabel: "Sales",
                    legendTitle: "Topping"
                )
                
                HeatMap(
                    salesCount: pancakesData.salesCategoryVsStore,
                    chartTitle: "Topping vs. Store",
                    xAxisLabel: "Topping",
                    yAxisLabel: "Store",
                    legendTitle: "Sales"
                )
            }
        }
    }
}

// MARK: - Preview
struct SummaryView_Preview: PreviewProvider {
    static var previews: some View {
        SummaryView(pancakesData: PancakesData())
            .frame(minWidth: 900, minHeight: 600)
    }
}
