//
//  CardModel.swift
//  SwiftIntro
//
//  Created by Alexander Georgii-Hemming Cyon on 01/06/16.
//  Copyright © 2016 SwiftIntro. All rights reserved.
//

import Foundation

protocol Model {}

struct CardModel {
    var imageUrl: String
}

extension CardModel: Model {}