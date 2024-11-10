document.querySelectorAll('.nav-link').forEach(function(link) {
    link.addEventListener('click', function(event) {
        // Ngăn chặn hành vi mặc định của thẻ <a>
        event.preventDefault();
        const linkHover = link.nextElementSibling;
        document.querySelectorAll('.link-hover').forEach(function(otherLinkHover) {
            if (otherLinkHover !== linkHover) {
                otherLinkHover.classList.remove('show');
            }
        });

        // Bật/tắt class 'show' cho link-hover liên kết
        linkHover.classList.toggle('show');
    });
});
