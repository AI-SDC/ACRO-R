document.addEventListener('DOMContentLoaded', function() {
  const toggleButton = document.createElement('button');
  toggleButton.innerHTML = '🌙';
  toggleButton.className = 'lightswitch';
  toggleButton.setAttribute('aria-label', 'Toggle dark mode');
  
  const navbar = document.querySelector('.navbar-nav');
  if (navbar) {
    const li = document.createElement('li');
    li.className = 'nav-item';
    li.appendChild(toggleButton);
    navbar.appendChild(li);
  }
  
  toggleButton.addEventListener('click', function() {
    const currentTheme = document.documentElement.getAttribute('data-bs-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    
    document.documentElement.setAttribute('data-bs-theme', newTheme);
    toggleButton.innerHTML = newTheme === 'dark' ? '☀️' : '🌙';
    
    localStorage.setItem('theme', newTheme);
  });
  
  const savedTheme = localStorage.getItem('theme') || 'light';
  document.documentElement.setAttribute('data-bs-theme', savedTheme);
  toggleButton.innerHTML = savedTheme === 'dark' ? '☀️' : '🌙';
});