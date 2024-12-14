const info = document.querySelector(".user-account")
const overlay = document.querySelector(".overlay")
const btnclose = document.querySelector(".close-user")
const user = document.getElementById("user")

user.addEventListener('click', () => {
    info.classList.add('active')
    overlay.style.display = 'block'
})

btnclose.addEventListener('click', () => {
    info.classList.remove('active')
    overlay.style.display = 'none'
})