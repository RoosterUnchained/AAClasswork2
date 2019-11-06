function curriedSum(numArgs) {
  let numbers = []; 

  function _curriedSum(num) {
    numbers.push(num); 
    if (numbers.length === numArgs) {
      let sum = 0; 
      numbers.forEach(n => sum += n); 
      return sum; 
    } else {
      return _curriedSum; 
    };
  };
  return _curriedSum; 
}; 

Function.prototype.curry = function(numArgs) {
  let args = [];
  let that = this
  function _curry(arg) { 
    args.push(arg);
    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _curry;
    };
  };
  return _curry; 
};