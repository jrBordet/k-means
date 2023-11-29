//
//  KMeans.swift
//
//  Created by John Gill on 2/25/16.

import Foundation

public class KMeans {
    public let numCenters: Int
    public let convergeDist: Double
    
    public init(
        numCenters: Int,
        convergeDist: Double
    ) {
        self.numCenters = numCenters
        self.convergeDist = convergeDist
    }
    
    private func nearestCenter(x: Vector, centers: [Vector]) -> Int {
        var nearestDist: Double = .greatestFiniteMagnitude
        var minIndex = 0
        
        for (idx, c) in centers.enumerated() {
            let dist = x.distTo(v2: c)
            if dist < nearestDist {
                minIndex = idx
                nearestDist = dist
            }
        }
        
        return minIndex
    }
    
    public  func findCenters(points: [Vector]) -> [Vector] {
        var centerMoveDist = 0.0
        let zeros: [Double] = Array(repeating: 0.0, count: points[0].length)
        
        var kCenters = reservoirSample(samples: points, k: numCenters)
        
        repeat {
            var cnts: [Double] = Array(repeating: 0.0, count: numCenters)
            var newCenters: [Vector] = Array(repeating: Vector(d:zeros), count: numCenters)
            
            for p in points {
                let c = nearestCenter(x: p, centers: kCenters)
                cnts[c] += 1
                newCenters[c] += p
            }
            
            for idx in 0..<numCenters {
                newCenters[idx] /= cnts[idx]
            }
            
            centerMoveDist = 0.0
            for idx in 0..<numCenters {
                centerMoveDist += kCenters[idx].distTo(v2: newCenters[idx])
            }
            
            kCenters = newCenters
        } while centerMoveDist > convergeDist
        
        return kCenters
    }
}

// Pick k random elements from samples
public func reservoirSample<T>(samples:[T], k:Int) -> [T] {
    var result = [T]()
    
    // Fill the result array with first k elements
    for i in 0..<k {
        result.append(samples[i])
    }
    
    // randomly replace elements from remaining pool
    for i in (k + 1)..<samples.count {
        let j = arc4random() % UInt32(i + 1)
        if j < k {
            result[Int(j)] = samples[i]
        }
    }
    return result
}


