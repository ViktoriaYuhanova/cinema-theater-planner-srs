function addTask() {
  const taskInput = document.getElementById('taskInput');
  const taskText = taskInput.value.trim();

  if (taskText === '') {
    alert('Введите текст задачи!');
    return;
  }

  const taskList = document.getElementById('taskList');
  const li = document.createElement('li');

  const checkbox = document.createElement('input');
  checkbox.type = 'checkbox';
  checkbox.addEventListener('change', function () {
    li.classList.toggle('completed', checkbox.checked);
  });

  const span = document.createElement('span');
  span.textContent = taskText;

  li.appendChild(checkbox);
  li.appendChild(span);
  taskList.appendChild(li);

  taskInput.value = '';
  taskInput.focus();
}