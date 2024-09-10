import { apiInitializer } from "discourse/lib/api";
import HeaderCtaButton from "../components/header-cta-button";
import SidebarCtaButton from "../components/sidebar-cta-button";

export default apiInitializer("1.15.0", (api) => {
  api.renderInOutlet("before-header-panel", HeaderCtaButton);
  api.renderInOutlet("after-sidebar-sections", SidebarCtaButton);
});