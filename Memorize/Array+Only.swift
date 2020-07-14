//
//  Array+Only.swift
//  Memorize
//
//  Created by Murillo R. Araujo on 14/07/20.
//  Copyright © 2020 MR de Araujo. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
