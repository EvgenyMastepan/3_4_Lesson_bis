//
//  Extensions.swift
//  3_4_bis_Lesson
//
//  Created by Evgeny Mastepan on 27.08.2025.
//

import SwiftUI

extension View {
    
    func titleTextStyle() -> some View {
        self.modifier(TitleTextStyle())
    }
    
    func commonTextFieldStyle() -> some View {
        self.modifier(CommonTextFieldStyle())
    }
    
    func commonButtonStyle() -> some View {
        self.buttonStyle(CommonButtonStyle())
    }
}

