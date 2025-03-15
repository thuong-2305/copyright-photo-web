function togglePopup() {
    const popup = document.getElementById("userPopup");
    if (popup.style.display === "block") {
        popup.style.display = "none";
    } else {
        popup.style.display = "block";
    }
}

// Đóng popup khi click bên ngoài
window.onclick = function (event) {
    const popup = document.getElementById("userPopup")
    if (event.target !== popup && !popup.contains(event.target) && event.target !== document.querySelector(".user-icon")) {
        popup.style.display = "none"
    }
}

// Mở và đóng fullscreen
const fullScreenBtn = document.getElementById("fullscreenBtn")

fullScreenBtn.addEventListener("click", function (event) {
    event.preventDefault();

    if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen();
        fullScreenBtn.classList.replace("bi-fullscreen", "bi-fullscreen-exit")
    } else {
        document.exitFullscreen();
        fullScreenBtn.classList.replace("bi-fullscreen-exit", "bi-fullscreen")
    }
})

// Thu gọn sidebar
document.getElementById("toggleSidebar").addEventListener("click", function () {
    let sidebar = document.querySelector(".container-main .left");
    let mainContent = document.querySelector(".container-main .right-category");
    let navbarTop = document.querySelector(".right-category nav")
    let titleLogo = document.querySelector(".container-main .left .title-logo")

    sidebar.classList.toggle("collapsed");
    mainContent.classList.toggle("expanded");
    navbarTop.classList.toggle("expanded");

    if (titleLogo.innerHTML.trim() === "CR") {
        titleLogo.innerHTML = `<span class="text-logo fw-bold">CoRiPhoto</span> Admin`;
    } else {
        titleLogo.innerHTML = "CR";
    }
});

// Chức năng dark mode
document.addEventListener("DOMContentLoaded", function() {
    const darkModeToggle = document.getElementById("darkModeToggle");
    const darkModeIcon = document.getElementById("darkModeIcon");
    const body = document.body;

    if (localStorage.getItem("darkMode") === "enable") {
        body.classList.add("dark-mode");
        darkModeIcon.classList.replace("bi-brightness-high", "bi-moon");
    }

    darkModeToggle.addEventListener("click", function (e) {
        e.preventDefault();
        body.classList.toggle("dark-mode");

        if (body.classList.contains("dark-mode")) {
            darkModeIcon.classList.replace("bi-brightness-high", "bi-moon");
            localStorage.setItem("darkMode", "enabled");
        } else {
            darkModeIcon.classList.replace("bi-moon", "bi-brightness-high");
            localStorage.setItem("darkMode", "disabled");
        }
    });
})
