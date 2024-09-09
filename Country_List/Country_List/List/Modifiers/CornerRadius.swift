//
//  CornerRadius.swift
//  Country_List
//
//  Created by vishwas ng on 28/07/24.
//

import Foundation
import SwiftUI

struct CustomBackgroundModifier: ViewModifier {
func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
