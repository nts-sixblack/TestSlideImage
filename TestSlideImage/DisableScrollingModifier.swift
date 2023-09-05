//
//  DisableScrollingModifier.swift
//  TestSlideImage
//
//  Created by Thanh Sau on 12/07/2023.
//

import Foundation
import SwiftUI

struct DisableScrollingModifier: ViewModifier {
    var disabled: Bool
    
    func body(content: Content) -> some View {
    
        if disabled {
            content
                .simultaneousGesture(DragGesture(minimumDistance: 0))
        } else {
            content
        }
        
    }
}

extension View {
    func scrollingDisabled(_ disabled: Bool) -> some View {
        modifier(DisableScrollingModifier(disabled: disabled))
    }
}
