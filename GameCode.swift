import Foundation

let ball = OvalShape(width: 40, height: 40)
let barrierWidth = 300.0
let barrierHeight = 25.0

let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: barrierHeight),
    Point(x: barrierWidth, y: barrierHeight),
    Point(x: barrierWidth, y: 0)
]

let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]

let barrier = PolygonShape(points: barrierPoints)

let funnel = PolygonShape(points: funnelPoints)
/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/

fileprivate func setupBall() {
    ball.position = Point(x: 250, y: 400)
    scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .blue
}

fileprivate func setupBarrier() {
    barrier.position = Point(x: 200, y: 150)
    barrier.hasPhysics = true
    scene.add(barrier)
    barrier.isImmobile = true
    barrier.fillColor = .darkGray
}

fileprivate func setupFunnel() {
    funnel.position = Point(x: 200, y: scene.height - 25)
    scene.add(funnel)
    funnel.onTapped = dropBall
    funnel.fillColor = .blue
}

func setup() {
    setupBall()
    
    setupBarrier()
    
    setupFunnel()
    
}

func dropBall() {
    ball.position = funnel.position
}
