//
//  StringExt.swift
//  tipsCalc
//
//  Created by danilka on 09.06.2023.
//

import Foundation
import SwiftUI

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttrinbutes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttrinbutes)
        
        return size.width
    }
}
