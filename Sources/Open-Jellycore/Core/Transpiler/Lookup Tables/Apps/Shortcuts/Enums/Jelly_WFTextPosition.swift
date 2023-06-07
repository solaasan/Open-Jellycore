//
//  Jelly_WFTextPosition.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFTextPosition: String, JellyEnum, Codable {
	case Center
	case TopLeft
	case TopMiddle
	case TopRight
	case BottomLeft
	case BottomMiddle
	case BottomRight
	case Custom

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Center:
			return "Center"
		case .TopLeft:
			return "Top Left"
		case .TopMiddle:
			return "Top Middle"
		case .TopRight:
			return "Top Right"
		case .BottomLeft:
			return "Bottom Left"
		case .BottomMiddle:
			return "Bottom Middle"
		case .BottomRight:
			return "Bottom Right"
		case .Custom:
			return "Custom"

        }
    }
}

extension Jelly_WFTextPosition {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
