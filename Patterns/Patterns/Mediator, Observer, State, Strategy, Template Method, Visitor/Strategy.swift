import Foundation

class Point {}
class Track {}

protocol iPlanner {
    func Build(a: Point, b: Point) -> Track
}

class MapApp{
    private var planner: iPlanner
    
    init(planner: iPlanner) {
        self.planner = planner
    }
    
    func setPlanner(planner_: iPlanner){
        planner = planner_
    }
    
    func buildTrack(a: Point, b: Point) -> Track{
        planner.Build(a: a, b: b)
    }
}

class WalkPlanner: iPlanner{
    func Build(a: Point, b: Point) -> Track {
        print("Walk Track")
        return Track()
    }
}

class CarPlanner: iPlanner{
    func Build(a: Point, b: Point) -> Track {
        print("Car Track")
        return Track()
    }
}
