import window from '@ohos.window';
import hilog from '@ohos.hilog';

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

function toChangeScreenLandscape(context:any){
  try {
    window.getLastWindow(context).then(res => {
      hilog.info(0x0000, 'testTag', '%{private}s', `--------LANDSCAPE 1 res:  ${res}`);
      let windowClass = res
      let orientation = window.Orientation.LANDSCAPE;
      try {
        windowClass.setPreferredOrientation(orientation, (err) => {
          if (err.code) {
            console.error('Failed to set window orientation. Cause: ' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in setting window orientation.');
        });
      } catch (exception) {
        console.error('Failed to set window orientation. Cause: ' + JSON.stringify(exception));
      }
    }).catch(err => {
      console.log('err: ', err)
    })
  } catch (exception) {
    hilog.info(0x0000, 'testTag', '%{private}s', `--------LANDSCAPE 1 err: ${JSON.stringify(exception)}`);
  }
}

function toChangeScreenVertical(context:any){
  try {
    window.getLastWindow(context).then(res => {
      hilog.info(0x0000, 'testTag', '%{private}s', `--------VERTICAL 1 res:  ${res}`);
      let windowClass = res
      let orientation = window.Orientation.UNSPECIFIED;
      try {
        windowClass.setPreferredOrientation(orientation, (err) => {
          if (err.code) {
            console.error('Failed to set window orientation. Cause: ' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in setting window orientation.');
        });
      } catch (exception) {
        console.error('Failed to set window orientation. Cause: ' + JSON.stringify(exception));
      }
    }).catch(err => {
      console.log('err: ', err)
    })
  } catch (exception) {
    hilog.info(0x0000, 'testTag', '%{private}s', `--------VERTICAL 1 err: ${JSON.stringify(exception)}`);
  }
}

function getRandomInt(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

export {
  calculateAngle,
  toChangeScreenLandscape,
  toChangeScreenVertical,
  getRandomInt
}