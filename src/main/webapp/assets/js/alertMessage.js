document.addEventListener("DOMContentLoaded", function () {
    const alertMessage = document.getElementById("alertMessage");
    if (alertMessage) {
        alertMessage.style.display = "block";
        setTimeout(() => {
            alertMessage.style.display = "none";
        }, 2000);
    }
});
