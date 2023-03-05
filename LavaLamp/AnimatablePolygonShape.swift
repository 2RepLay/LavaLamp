//
//  AnimatablePolygonShape.swift
//  LavaLamp
//
//  Created by nikita on 05.03.2023.
//

import SwiftUI

struct AnimatablePolygonShape: Shape {
	
	var animatableData: [Double]
	
	init(points: [Double]) {
		animatableData = points
	}
	
	func path(in rect: CGRect) -> Path {
		Path() { path in
			let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
			let radius = min(center.x, center.y)
			
			let lines = animatableData.enumerated().map { index, value in
				let fraction = Double(index) / Double(animatableData.count)
				let xPos = center.x + radius * cos(fraction * .pi * 2)
				let yPos = center.y + radius * sin(fraction * .pi * 2)
				return CGPoint(x: xPos * value, y: yPos * value)
			}
			
			path.addLines(lines)
		}	
	}
	
}
