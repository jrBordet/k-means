import Foundation

// https://www.geeksforgeeks.org/k-means-clustering-introduction/

//Initialize k means with random values
//
//--> For a given number of iterations:
//
//    --> Iterate through items:
//
//        --> Find the mean closest to the item by calculating
//        the euclidean distance of the item with each of the means
//
//        --> Assign item to mean
//
//        --> Update mean by shifting it to the average of the items in that cluster

// https://victorqi.gitbooks.io/swift-algorithm/content/k-means_clustering.html

// https://github.com/johnsgill3/swift-algorithm-club

// https://github.com/johnsgill3/swift-algorithm-club/tree/master/K-Means

var points = [Vector]()

func genPoints(numPoints: Int, numDimmensions: Int) {
    for _ in 0..<numPoints {
        var data = [Double]()
        
        for _ in 0..<numDimmensions {
            data.append(Double(arc4random_uniform(UInt32(numPoints * numDimmensions))))
        }
        
        points.append(Vector(d: data))
    }
}

genPoints(numPoints: 10, numDimmensions: 2)

print("\nCenters")

let kmm = KMeans(numCenters: 3, convergeDist: 0.01)

for c in kmm.findCenters(points: points) {
    print(c.description)
}

let centroids: [Vector] = kmm.findCenters(points: points)


//func testSmall_10D() {
//    genPoints(10, numDimmensions: 10)
//
//    print("\nCenters")
//    let kmm = KMeans(numCenters: 3, convergeDist: 0.01)
//    for c in kmm.findCenters(points) {
//        print(c)
//    }
//}
//
//func testLarge_2D() {
//    genPoints(10000, numDimmensions: 2)
//
//    print("\nCenters")
//    let kmm = KMeans(numCenters: 5, convergeDist: 0.01)
//    for c in kmm.findCenters(points) {
//        print(c)
//    }
//}
//
//func testLarge_10D() {
//    genPoints(10000, numDimmensions: 10)
//
//    print("\nCenters")
//    let kmm = KMeans(numCenters: 5, convergeDist: 0.01)
//    for c in kmm.findCenters(points) {
//        print(c)
//    }
//}
