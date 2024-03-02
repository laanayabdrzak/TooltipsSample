//
//  Tip.swift
//  TooltipsSample
//
//  Created by LAANAYA Abderrazak on 2/3/2024.
//

import Foundation
import TipKit

struct AddColorTip: Tip {
    var title: Text {
        return Text("Add Color")
            .foregroundColor(.teal)
    }
    
    var message: Text? {
        return Text("Press the button to add new color")
    }
    
    var image: Image? {
        return Image(systemName: "paintpalette")
    }
}

struct FavoriteTip: Tip {
    static let favoriteEvent = Event(id: "favoriteEvent")
    static let numberVisitedEvent = Event(id: "numberVisitedEvent")
    
    var title: Text {
        return Text("Set Favorite")
            .foregroundColor(.teal)
    }
    
    var message: Text? {
        return Text("Tap and hold to set as Favorite")
    }
    
    var rules: [Rule] {
        #Rule(FavoriteTip.favoriteEvent) { event in
            event.donations.count == 0
        }
        
        #Rule(FavoriteTip.numberVisitedEvent) { event in
            event.donations.count > 1
        }
    }
}
