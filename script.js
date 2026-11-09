function addTask() {
  const taskInput = document.getElementById('taskInput');
  const taskText = taskInput.value.trim();

  if (taskText === '') {
    alert('Введите текст задачи!');
    return;
  }

  const taskList = document.getElementById('taskList');
  const li = document.createElement('li');

  // Чекбокс для отметки выполнения
  const checkbox = document.createElement('input');
  checkbox.type = 'checkbox';
  checkbox.addEventListener('change', function () {
    li.classList.toggle('completed', checkbox.checked);
  });

  const span = document.createElement('span');
  span.textContent = taskText;

  const deleteButton = document.createElement('button');
  deleteButton.textContent = 'Удалить';
  deleteButton.className = 'delete-btn';
  deleteButton.addEventListener('click', function () {
    li.remove();
  });

  li.appendChild(checkbox);
  li.appendChild(span);
  li.appendChild(deleteButton);
  taskList.appendChild(li);

  taskInput.value = '';
  taskInput.focus();
}
