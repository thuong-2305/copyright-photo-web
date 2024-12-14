document.addEventListener("DOMContentLoaded", () => {
    const tableRows = document.querySelectorAll(".table tbody tr");

    const detailBox = document.getElementById("detailBox");
    const imageCode = document.getElementById("imageCode");
    const imagePreview = document.getElementById("imagePreview");
    const imagePrice = document.getElementById("imagePrice");
    const uploader = document.getElementById("uploader");
    const category = document.getElementById("category");
    const overlay = document.getElementById("overlay");


    tableRows.forEach(row => {
        row.addEventListener("click", () => {
            tableRows.forEach(r => r.classList.remove("selected"));

            row.classList.add("selected");

            const cells = row.querySelectorAll("td");
            imageCode.textContent = cells[0].textContent;
            imagePreview.src = cells[1].querySelector("img").src;
            imagePrice.textContent = cells[2].textContent;
            uploader.textContent = cells[3].textContent;
            category.textContent = cells[4].textContent;

            detailBox.classList.add("active");
            overlay.classList.add("active");

        });
    });

    overlay.addEventListener("click", () => {
        detailBox.classList.remove("active");
        overlay.classList.remove("active");
    });

    document.querySelector(".fa-xmark").addEventListener('click', () => {
        detailBox.classList.remove("active");
        overlay.classList.remove("active");
    })
});

