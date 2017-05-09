function getRandom(min, max) {
  return Math.random() * (max - min) + min;
}

function f(x) {
  return new Promise(function(resolve) {
    setTimeout(function() {
        console.log(x);
        resolve(true);
    }, getRandom(0,3000));
  });
}

async function step(){
    await f("f1");
    await f("f2");
    await f("f3");
}

step();
