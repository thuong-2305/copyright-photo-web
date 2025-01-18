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
