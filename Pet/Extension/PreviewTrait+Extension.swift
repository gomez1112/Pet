//
//  PreviewTrait+Extension.swift
//  Pet
//
//  Created by Gerard Gomez on 1/19/25.
//

import Foundation
import DeveloperToolsSupport

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var previewData: Self = .modifier(PreviewData())
}
