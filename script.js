function addTask() {
  const taskInput = document.getElementById('taskInput');
  const taskText = taskInput.value.trim();

  if (taskText === '') {
    alert('Введите текст задачи!');
    return;
  }

  const taskList = document.getElementById('taskList');
  const li = document.createElement('li');

  const span = document.createElement('span');
  span.textContent = taskText;
  li.appendChild(span);

  taskList.appendChild(li);

  taskInput.value = '';
  taskInput.focus();
}
