//
//  ParticleSystem.swift
//  LavaLamp
//
//  Created by nikita on 05.03.2023.
//

import Foundation

class ParticleSystem {
	
	let particles: [Particle]
	var lastUpdate = Date.now.timeIntervalSinceReferenceDate
	
	init(count: Int) {
		particles = (0..<count).map { _ in Particle() } 
	}
	
	func update(date: TimeInterval) {
		let delta = date - lastUpdate
		lastUpdate = date
		
		for particle in particles {
			if particle.isMovingDown {
				particle.y += particle.speed * delta
				
				if particle.y > 1.25 {
					particle.isMovingDown = false
				}
			} else {
				particle.y -= particle.speed * delta
				
				if particle.y < -0.25 {
					particle.isMovingDown = true
				}
			}
		}
	}
	
}
