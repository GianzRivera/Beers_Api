//
//  View+Ext.swift
//  Beers
//
//  Created by Gian Rivera on 16/09/23.
//

import SwiftUI

extension View {

    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }

}
