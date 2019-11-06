let todos = [];
let todoEl = document.querySelector('.todos');
let addTodoEl = document.querySelector('.add-todo-form');

const addTodo = function() {
 let item = document.querySelector("[name=add-todo]").value;
 const todo = {item, done: false}; 
 todos.push(todo);
 item.value = '';  
 populateList(todos, todoEl);
};
 
const populateList = function(array, list) {
  list.innerHTML = array.map((todo) => {
    return `<li> 
      <input type="checkbox"> ${todo.done ? "checked" : ""}/> 
      <label> ${todo.item} </label>
      </li>`;
  }).join('');
};