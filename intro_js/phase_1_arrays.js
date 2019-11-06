Array.prototype.uniq = function() {
  const unique = []; 
  for(i = 0; i < this.length ; i++){
    if(!unique.includes(this[i])){
      unique.push(this[i]);
    }
  }
  return unique;
}

  

// [1, 2, 2, 3, 3, 3].uniq();

Array.prototype.twoSum = function(){
  const twoSums = [];
  for(i = 0; i < this.length; i++){
    const ele1 = this[i];
    for(j = 0; j < this.length; j++){
      const ele2 = this[j];
      if((i < j) && (ele1 + ele2 === 0)){
        twoSums.push([i , j])
      }
    }
  }
  return twoSums;
}
// [1, 2, 3, -1, -3].twoSum(); //[[0, 3], [2, 4]]

Array.prototype.transpose = function(){
  const transposed = [];
  for(col = 0; col < this.length; col++){
    const rows = [];
    for(row = 0; row < this.length; row++){
      rows.push(this[row][col]);
    }
    transposed.push(rows);
  }
  return transposed;
}

array = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

// array.transpose(); => 
// [
//   [1, 4, 7],
//   [2, 5, 8],
//   [3, 6, 9]
// ]
// [[1, 2, 3], [4, 5, 6], [7, 8, 9]].transpose();