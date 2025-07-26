document.addEventListener('DOMContentLoaded', function() {
    // Menu Toggle
    const menuToggle = document.querySelector('.menuToggle');
    const navigation = document.querySelector('.navigation');
    
    menuToggle.addEventListener('click', function() {
        this.classList.toggle('active');
        navigation.classList.toggle('active');
    });

    // Theme Switch
    const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');
    const body = document.body;
    const lightVideo = document.querySelector('.background-video');
    const darkVideo = document.querySelector('.background-video-dark');
    
    // Check for saved theme preference
    const currentTheme = localStorage.getItem('theme') || localStorage.getItem('dark-mode');
    if (currentTheme === 'dark' || currentTheme === 'enabled') {
        body.classList.add('dark');
        if (toggleSwitch) toggleSwitch.checked = true;
        if (lightVideo) lightVideo.style.display = 'none';
        if (darkVideo) darkVideo.style.display = 'block';
    } else {
        if (lightVideo) lightVideo.style.display = 'block';
        if (darkVideo) darkVideo.style.display = 'none';
    }
    
    // Toggle dark mode
    if (toggleSwitch) {
        toggleSwitch.addEventListener('change', function() {
            if (this.checked) {
                body.classList.add('dark');
                localStorage.setItem('theme', 'dark');
                localStorage.setItem('dark-mode', 'enabled');
                if (lightVideo) lightVideo.style.display = 'none';
                if (darkVideo) darkVideo.style.display = 'block';
            } else {
                body.classList.remove('dark');
                localStorage.setItem('theme', 'light');
                localStorage.setItem('dark-mode', 'disabled');
                if (lightVideo) lightVideo.style.display = 'block';
                if (darkVideo) darkVideo.style.display = 'none';
            }
        });
    }

    // Close menu when clicking on a link
    const navLinks = document.querySelectorAll('.navigation a');
    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            menuToggle.classList.remove('active');
            navigation.classList.remove('active');
        });
    });

    // Search Button (if exists)
    const searchBtn = document.getElementById('searchBtn');
    if (searchBtn && searchBtn.tagName === 'BUTTON') {
        searchBtn.addEventListener('click', function(e) {
            e.preventDefault();
            window.location.href = '/upload';
        });
    }
});