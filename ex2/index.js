function getRandom(min, max) {
  return Math.random() * (max - min) + min;
}

function f1() {
  return new Promise(function(resolve) {
    setTimeout(function() {
        console.log("f1");
        resolve(true);
    }, getRandom(0,3000));
  });
}

function f2() {
  return new Promise(function(resolve) {
    setTimeout(function() {
        console.log("f2");
        resolve(true);
    }, getRandom(0,3000));
  });
}

function f3() {
  return new Promise(function(resolve) {
    setTimeout(function() {
        console.log("f3");
        resolve(true);
    }, getRandom(0,3000));
  });
}

async function step(){
    await f1();
    await f2();
    await f3();
}

step();
