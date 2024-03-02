class Point {
  x: number
  y: number

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

function calculateAngle(pointA: Point, pointB: Point) {
  const dx = pointB.x - pointA.x;
  const dy = pointB.y - pointA.y;
  const radians = Math.atan2(dy, dx);
  const degrees = radians * (180 / Math.PI);
  return (degrees + 360) % 360; // Ensure angle is positive and within [0, 360)
}

export {
  calculateAngle
}