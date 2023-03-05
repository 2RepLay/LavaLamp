//
//  AnimatingPolygon.swift
//  LavaLamp
//
//  Created by nikita on 05.03.2023.
//

import SwiftUI

struct AnimatingPolygon: View {
	
	@State private var points = Self.makePoints()
	@State private var timer = Timer.publish(every: 1, tolerance: 1, on: .main, in: .common).autoconnect() 
	
    var body: some View {
        AnimatablePolygonShape(points: points)
			.animation(.easeInOut(duration: 3), value: points)
			.onReceive(timer) { date in
				points = Self.makePoints()
			}
    }
	
	static func makePoints() -> [Double] {
		(0..<8).map {
			_ in .random(in: 0.8...1.2)
		}
	}
}

struct AnimatingPolygon_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingPolygon()
    }
}
