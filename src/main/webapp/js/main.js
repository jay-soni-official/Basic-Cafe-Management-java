const modal = document.getElementById("authModal");
const loginForm = document.getElementById("loginForm");
const signupForm = document.getElementById("signupForm");

function openAuth() {
    modal.style.display = "flex";
    showLogin();
}

function closeAuth() {
    modal.style.display = "none";
}

function showLogin() {
    loginForm.style.display = "block";
    signupForm.style.display = "none";
}

function showSignup() {
    loginForm.style.display = "none";
    signupForm.style.display = "block";
}

window.onclick = function (e) {
    if (e.target === modal) {
        closeAuth();
    }
};
