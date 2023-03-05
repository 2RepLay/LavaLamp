//
//  +Array.swift
//  LavaLamp
//
//  Created by nikita on 05.03.2023.
//

import SwiftUI

extension Array: VectorArithmetic, AdditiveArithmetic where Element == Double {
	
	public static var zero = [0.0]
	
	public static func +=(lhs: inout [Double], rhs: [Double]) {
		for (index, item) in rhs.enumerated() {
			lhs[index] += item
		}
	}
	
	public static func -=(lhs: inout [Double], rhs: [Double]) {
		for (index, item) in rhs.enumerated() {
			lhs[index] -= item
		}
	}
	
	public mutating func scale(by rhs: Double) {
		for (index, item) in self.enumerated() {
			self[index] = item * rhs
		}
	}
	
	public var magnitudeSquared: Double {
		0
	}
	
	public static func - (lhs: Array<Element>, rhs: Array<Element>) -> Array<Element> {
		[]
	}
	
} 
