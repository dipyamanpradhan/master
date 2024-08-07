document.addEventListener('DOMContentLoaded', function() {
  const form = document.querySelector('form');
  form.addEventListener('submit', function(event) {
    const email = document.querySelector('input[type="text"]').value;
    const password = document.querySelector('input[type="password"]').value;

    if (!email || !password) {
      event.preventDefault();
      alert('Please fill in both fields.');
    }
  });
});
