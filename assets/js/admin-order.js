document.querySelectorAll(".table-hover tbody tr").forEach(row => {
    row.addEventListener("click", function () {
        document.querySelectorAll(".table-hover tbody tr").forEach(r => r.classList.remove("selected"));

        this.classList.add("selected");

        document.getElementById("details").classList.add("active");
    });
});


const tabs = document.querySelectorAll('.tab');
const contents = document.querySelectorAll('.content');

tabs.forEach(tab => {
    tab.addEventListener('click', () => {
        tabs.forEach(t => t.classList.remove('active'));
        contents.forEach(c => c.classList.remove('active'));

        tab.classList.add('active');
        document.getElementById(tab.dataset.target).classList.add('active');
    });
});

document.querySelector(".fa-xmark").addEventListener('click', () => {
    document.getElementById("details").classList.remove("active");
})
