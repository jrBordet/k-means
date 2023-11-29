import Foundation

// Container to easily hold N Dimensional Vectors
public class Vector: CustomStringConvertible, Equatable {
    private(set) var length = 0
    private(set) var data = [Double]()
    
    public init(d: [Double]) {
        data = d
        length = d.count
    }
    
    public var description: String { "Vector (\(data)" }
    
    public func distTo(v2:Vector) -> Double {
        var result = 0.0
        for idx in 0..<self.length {
            result += pow(self.data[idx] - v2.data[idx], 2.0)
        }
        return sqrt(result)
    }
}

// MARK: Vector Operators
public func ==(left: Vector, right: Vector) -> Bool {
    for idx in 0..<left.length {
        if left.data[idx] != right.data[idx] {
            return false
        }
    }
    return true
}

public func +(left: Vector, right: Vector) -> Vector {
    var results = [Double]()
    for idx in 0..<left.length {
        results.append(left.data[idx] + right.data[idx])
    }
    return Vector(d: results)
}

public func +=(left: inout Vector, right: Vector) {
    left = left + right
}

public func -(left: Vector, right: Vector) -> Vector {
    var results = [Double]()
    for idx in 0..<left.length {
        results.append(left.data[idx] - right.data[idx])
    }
    return Vector(d: results)
}

public func -=(left: inout Vector, right: Vector) {
    left = left - right
}

public func /(left: Vector, right: Double) -> Vector  {
    var results: [Double] = Array(repeating: 0.0, count: left.length)
    
    for (idx, value) in left.data.enumerated() {
        results[idx] = value / right
    }
    
    return Vector(d: results)
}

public func /=(left: inout Vector, right: Double) {
    left = left / right
}

