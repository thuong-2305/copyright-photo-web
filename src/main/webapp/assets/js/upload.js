const uploadButton = document.getElementById("btn-upload1");
const overlay2 = document.querySelector(".overlay2");
const windowUpload = document.querySelector(".upload");
const closeWindow = document.querySelector(".close-upload");
const optionContent = document.querySelector(".option.v2");
const inputAdd = document.getElementById("file-upload");
const paneShow = document.querySelector(".show-pane");
const next = document.querySelector(".next");
const contentTwo = document.querySelector(".content-2")
const contentThree = document.querySelector(".content-3")
const step1 = document.getElementById("step1");
const step2 = document.getElementById("step2");
const step3 = document.getElementById("step3");
const navlist = document.querySelector(".nav-list");
const succes = document.querySelector(".success");

uploadButton.addEventListener('click', () => {
    windowUpload.classList.add("active");
    overlay2.style.display = 'block';
    document.body.classList.add('no-scroll');
})

closeWindow.addEventListener('click', () => {
    windowUpload.classList.remove("active");
    overlay2.style.display = 'none';
    paneShow.classList.remove("curr");
    optionContent.classList.remove("pass");
    document.body.classList.remove('no-scroll');
})

inputAdd.addEventListener('click', (e) => {
    e.preventDefault();
    optionContent.classList.add("pass");
    paneShow.classList.add("curr");
})

next.addEventListener('click', (e) => {
    e.preventDefault();
    const title = document.getElementById('title').value.trim();
    const description = document.getElementById('description').value.trim();
    const dimension = document.getElementById('dimension').value.trim();
    const fileSize = document.getElementById('file-size').value.trim();
    const category = document.getElementById('category').value.trim();
    const price = document.getElementById('price').value;
    console.log(title, description, dimension, fileSize, category);
    if (!title || !description || !dimension || !fileSize || !category || !price) {
        $(".text-danger span").text("Vui lòng điền đủ thông tin về ảnh!");
        return;
    }
    step2.classList.add("complete");
    step2.classList.remove("active");
    step3.classList.add("active");
    contentTwo.classList.add("curr");
    navlist.classList.add("last");
    contentThree.classList.add("curr");
})

succes.addEventListener('click', () => {
    windowUpload.classList.remove("active");
    overlay2.style.display = 'none';
    paneShow.classList.remove("curr");
    optionContent.classList.remove("pass");
})