//
//  ContentView.swift
//  LavaLamp
//
//  Created by nikita on 05.03.2023.
//

import SwiftUI

struct ContentView: View {
	
	@State private var particleSystem = ParticleSystem(count: 15)
	@State private var threshold = 0.5
	@State private var blur = 30.0
	
    var body: some View {
        VStack {
            LinearGradient(
				colors: [
					.red, .orange
				], 
				startPoint: .top, 
				endPoint: .bottom
			).mask { 
				TimelineView(.animation) { timeline in
					Canvas { ctx, size in
						particleSystem.update(date: timeline.date.timeIntervalSinceReferenceDate)
						
						ctx.addFilter(.alphaThreshold(min: threshold))
						ctx.addFilter(.blur(radius: blur))
						
						ctx.drawLayer { ctx in
							for particle in particleSystem.particles {
								guard let shape = ctx.resolveSymbol(id: particle.id) else {
									continue
								}
								
								ctx.draw(shape, at: CGPoint(
									x: particle.x * size.width, 
									y: particle.y * size.height
								))
							}
						}
					} symbols: {
						ForEach(particleSystem.particles) { particle in
							Circle()
								.frame(
									width: particle.size,
									height: particle.size
								)
						}
					}
				}
			}
			.ignoresSafeArea()
			.background(.indigo)
			
			LabeledContent("Threshold") {
				Slider(value: $threshold, in: 0.1...0.99)
			}
			.padding(.horizontal)
			
			LabeledContent("Blur") {
				Slider(value: $blur, in: 0...40)
			}
			.padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
