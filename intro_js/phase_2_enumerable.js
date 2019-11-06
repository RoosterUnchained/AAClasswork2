Array.prototype.myEach = function(callback){
    for(i = 0; i < this.length; i++){
      callback(this[i]);
    }
};

// [1, 2, 3, 4, 5, 6].myEach((ele) = function(ele){
//   console.log(ele);
// });

// [1, 2, 3, 4, 5, 6].myEach(ele => console.log(ele));

Array.prototype.myMap = function(callback) {
  const mapped = [];
  this.myEach(ele => mapped.push(callback(ele)));
  return mapped;
};

// [1, 2, 3, 4, 5, 6].myEach(ele => console.log(ele + ele));

// Array.prototype.myReduce = function(callback, initVal){
//   if(initVal === undefined){
//     initVal = this.splice(0, 1);
//   }
//   let acc = initVal;
//   this.myEach(ele => acc = callback(acc, ele));
//   return acc;
// };

Array.prototype.myReduce = function(callback, initVal){
  let arr = this;
  if(initVal === undefined){
    initVal = arr[0];
    arr = arr.slice(1);
  }

  let acc = initVal;

  arr.myEach(ele => acc = callback(acc, ele));
  return acc;
};

// without initialValue
[1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
}); // => 6

// with initialValue
// [1, 2, 3].myReduce(function (acc, el) {
//   return acc + el;
// }, 25); // => 31
