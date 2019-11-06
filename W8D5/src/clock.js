import {htmlGenerator} from "./warmup";

class Clock {

  constructor() {
    // 1. Create a Date object.
    const time = new Date();
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    this.hours = time.getHours();
    this.minutes = time.getMinutes();
    this.seconds = time.getSeconds();
    this.printTime();
    setInterval(() => {
      this._tick();
    }, 1000);

    
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    return (`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    this.seconds += 1;
    if (this.seconds === 60) {
      this.minutes += 1;
      this.seconds = 0;
    }

    if (this.minutes === 60) {
      this.hours += 1;
      this.minutes = 0
    }

    if (this.hours === 24) {
      this.hours = 0;
      this.minutes = 0;
      this.hours = 0;
    }



    htmlGenerator(this.printTime(), clockElement);
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }
}

const clockElement = document.getElementById('clock');
const clock = new Clock();
