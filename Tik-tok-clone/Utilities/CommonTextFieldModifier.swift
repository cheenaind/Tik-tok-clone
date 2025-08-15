//
//  CommonTextFieldModifier.swift
//  Tik-tok-clone
//
//  Created by Kuandik Chingiz on 14.08.25.
//

import SwiftUI

struct CommonTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
