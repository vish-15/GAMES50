document.addEventListener('DOMContentLoaded', function() {
    const toggleButton = document.getElementById('sidebar-toggle');
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('main-content');

    toggleButton.addEventListener('click', function() {
        sidebar.classList.toggle('sidebar-open');
        mainContent.classList.toggle('sidebar-open');
    });
});
