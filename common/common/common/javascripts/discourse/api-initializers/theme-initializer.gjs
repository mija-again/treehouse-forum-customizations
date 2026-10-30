import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
    function updateSpankscuaryBanner() {
        requestAnimationFrame(() => {
            const banner = document.getElementById("spankscuary-forum-banner");

            if (!banner) {
                return;
            }

            const path = window.location.pathname.replace(/\/+$/, "") || "/";

            const isLandingPage =
                path === "/" ||
                path === "/login" ||
                path === "/login-required";

            const isLoggedOut = api.getCurrentUser() === null;

            banner.hidden = !(isLoggedOut && isLandingPage);
        });
    }

    api.onPageChange(() => {
        updateSpankscuaryBanner();
    });

    updateSpankscuaryBanner();
});
