class Enemy {
    var health = 100
    var attackStrength = 10

    func move() {
        print("Walks forward")
    }

    func attack() {
        print("Lands a hit, does \(attackStrength) damage.")
    }
}
