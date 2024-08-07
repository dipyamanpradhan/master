document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.editable').forEach(function(cell) {
    cell.addEventListener('click', function() {
      if (!cell.querySelector('input')) {
        const originalValue = cell.textContent;
        const field = cell.dataset.field;
        cell.innerHTML = `<input type="text" value="${originalValue}">`;
        const input = cell.querySelector('input');
        input.focus();

        input.addEventListener('blur', function() {
          const newValue = input.value;
          const studentId = cell.closest('tr').dataset.id;
          
          fetch(`/students/${studentId}`, {
            method: 'PATCH',
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({ student: { [field]: newValue } })
          })
          .then(response => response.json())
          .then(data => {
            if (data.errors) {
              alert('Error updating student');
              cell.innerHTML = originalValue;
            } else {
              cell.innerHTML = newValue;
            }
          });
        });
      }
    });
  });

  document.querySelectorAll('.delete').forEach(function(button) {
    button.addEventListener('click', function() {
      const row = button.closest('tr');
      const studentId = row.dataset.id;

      fetch(`/students/${studentId}`, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
      })
      .then(response => {
        if (response.ok) {
          row.remove();
        } else {
          alert('Error deleting student');
        }
      });
    });
  });

  document.querySelectorAll('.edit').forEach(function(button) {
    button.addEventListener('click', function() {
      const row = button.closest('tr');
      row.querySelectorAll('.editable').forEach(function(cell) {
        cell.click();
      });
    });
  });
});
