//
//  Color.swift
//  TooltipsSample
//
//  Created by LAANAYA Abderrazak on 2/3/2024.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(red: Double.random(in: 0...1),
                     green: Double.random(in: 0...1),
                     blue: Double.random(in : 0...1))
    }
}
