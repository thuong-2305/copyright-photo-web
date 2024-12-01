const navItem = document.querySelectorAll(".nav-list li");
const contentFrame = document.querySelector(".content-frame");
const infoUser = document.querySelector(".info-user");
const btnAgree = document.querySelector(".btn-agree");
const navList = document.querySelector(".nav-list");

function hideContent() {
    contentFrame.style.display = "none";
    infoUser.style.display = "block";
    navList.classList.add("mid");
    navItem[0].classList.remove("active");
    navItem[0].classList.add("complete");
    navItem[1].classList.add("active");
}

btnAgree.addEventListener("click", hideContent);

const btnSave = document.querySelector(".btn-save");
// const infoUser = document.querySelector(".info-user");
const welcomeFrame = document.querySelector(".welcome-frame");

function hideInfoUser(event) {
    // Ngăn hành động mặc định của submit form quay vể đầu trang
    event.preventDefault();

    infoUser.style.display = "none";
    welcomeFrame.style.display = "block";
    navList.classList.add("last");
    navItem[1].classList.remove("active");
    navItem[1].classList.add("complete");
    navItem[2].classList.add("active");
}

btnSave.addEventListener("click", hideInfoUser);