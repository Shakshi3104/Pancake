//
//  ContentView.swift
//  Pancake
//
//  Created by MacBook Pro M1 on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SummaryView(pancakesData: PancakesData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
