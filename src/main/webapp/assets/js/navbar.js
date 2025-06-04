document.querySelectorAll('.nav-link').forEach(function(link) {
    link.addEventListener('click', function(event) {
        event.preventDefault();
        
        const linkHover = link.nextElementSibling;
        document.querySelectorAll('.nav-item').forEach(function(otherLinkHover) {
            if (otherLinkHover !== linkHover) {
                otherLinkHover.classList.remove('show');
            }
        });

        const icon = link.querySelector('i');
        document.querySelectorAll('.nav-item .link-hover').forEach(function(otherLinkHover) {
            const otherIcon = otherLinkHover.previousElementSibling.querySelector('i');
            if (otherLinkHover !== linkHover) {
                otherLinkHover.classList.remove('show');
                if (otherIcon) {
                    otherIcon.classList.remove('fa-angle-up');
                    otherIcon.classList.add('fa-angle-down');
                }
            }
        });

        linkHover.classList.toggle('show');

        if (icon) {
            icon.classList.toggle('fa-angle-down');
            icon.classList.toggle('fa-angle-up');
        }
    });
});

// Mobile menu handling
document.addEventListener('DOMContentLoaded', function() {
    // Handle mobile user menu
    const userMobile = document.getElementById('user-mobile');
    const userDesktop = document.getElementById('user');
    const userAccount = document.querySelector('.user-account');
    const overlay = document.querySelector('.overlay');
    const closeBtn = document.querySelector('.close-user');

    // Function to open user menu
    function openUserMenu() {
        userAccount.classList.add('active');
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    // Function to close user menu
    function closeUserMenu() {
        userAccount.classList.remove('active');
        overlay.classList.remove('active');
        document.body.style.overflow = '';
    }

    // Event listeners
    if (userMobile) {
        userMobile.addEventListener('click', openUserMenu);
    }

    if (userDesktop) {
        userDesktop.addEventListener('click', openUserMenu);
    }

    if (closeBtn) {
        closeBtn.addEventListener('click', closeUserMenu);
    }

    if (overlay) {
        overlay.addEventListener('click', closeUserMenu);
    }

    // Close offcanvas when clicking on a link (mobile)
    const offcanvasElement = document.getElementById('offcanvasDarkNavbar');
    if (offcanvasElement) {
        const offcanvasLinks = offcanvasElement.querySelectorAll('.nav-link:not(.dropdown-toggle)');
        const offcanvasBS = bootstrap.Offcanvas.getInstance(offcanvasElement) || new bootstrap.Offcanvas(offcanvasElement);

        offcanvasLinks.forEach(link => {
            link.addEventListener('click', () => {
                offcanvasBS.hide();
            });
        });
    }

    // Handle window resize
    let resizeTimer;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function() {
            if (window.innerWidth > 768) {
                closeUserMenu();
                if (offcanvasElement) {
                    const offcanvasBS = bootstrap.Offcanvas.getInstance(offcanvasElement);
                    if (offcanvasBS) {
                        offcanvasBS.hide();
                    }
                }
            }
        }, 250);
    });
});

// Keep existing scroll functionality
const navbar = document.getElementById("nav");
window.addEventListener("scroll", function () {
    if (window.scrollY > 50) {
        navbar.classList.add("scrolled");
    } else {
        navbar.classList.remove("scrolled");
    }
});

