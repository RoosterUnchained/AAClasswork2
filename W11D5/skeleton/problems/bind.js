//No Args 
// Function.prototype.myBind = function (ctx) {
//   return () => this.apply(ctx);
// };

// Function.prototype.myBind = function (context) {
//   let bindArgs = Array.from(arguments).slice(1); 

//   return () => {
//     let callArgs = Array.from(arguments); 
//     return this.apply(context, bindArgs.concat(callArgs));
//   }; 
// };

Function.prototype.myBind = function (context, ...bindArgs) {
  
  return (...callArgs) => {
    return this.apply(context, bindArgs.concat(callArgs));
  }; 
};