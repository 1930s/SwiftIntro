//
//  CardModel.swift
//  SwiftIntro
//
//  Created by Alexander Georgii-Hemming Cyon on 01/06/16.
//  Copyright © 2016 SwiftIntro. All rights reserved.
//

import Foundation

protocol Model: ResponseCollectionSerializable, ResponseObjectSerializable {}

struct CardModel {
    var imageUrl: String!
}

extension CardModel: Model {
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        //swiftlint:disable force_cast
        self.imageUrl = representation.valueForKeyPath("name") as! String
    }

    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [CardModel] {
        guard let representation = representation as? [[String: AnyObject]] else { return [] }
        var cardModels: [CardModel] = []
        for cardRepresentation in representation {
            guard let card = CardModel(response: response, representation: cardRepresentation) else { continue }
            cardModels.append(card)
        }

        return cardModels
    }
}
