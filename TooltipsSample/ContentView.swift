//
//  ContentView.swift
//  TooltipsSample
//
//  Created by LAANAYA Abderrazak on 2/3/2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State private var colors = MockData.mockColors
    let addTipColor = AddColorTip()
    let favoriteTip = FavoriteTip()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TipView(favoriteTip)
                    .tipBackground(.teal.opacity(0.5))
                ForEach(colors, id: \.self) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill($0)
                        .frame(height: 100)
                        .contextMenu {
                            Button(action: {
                                Task { await FavoriteTip.favoriteEvent.donate() }
                            }, label: {
                                HStack {
                                    Image(systemName: "heart")
                                    Text("Favorite")
                                }
                            })
                        }
                }
            }
            .onAppear(){
                Task { await FavoriteTip.numberVisitedEvent.donate() }
            }
            .padding()
            .navigationTitle("Colors")
            .toolbar {
                Button(action: {
                    colors.insert(.random, at: 0)
                    addTipColor.invalidate(reason: .actionPerformed)
                }, label: {
                    Image(systemName: "plus.circle")
                })
                .popoverTip(addTipColor)
                .tipBackground(.teal.opacity(0.2))
            }
        }
    }
}

#Preview {
    ContentView()
}

struct MockData {
    static let mockColors = [Color.blue, Color.red, Color.green]
}
