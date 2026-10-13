import { defineConfig } from "vitepress";

const repository = "https://github.com/xNycrofox/dhsn-typst-template";

export default defineConfig({
  title: "DHSN Typst Template",
  description: "Typst template implementing the DHSN Dresden Styleguide",
  lang: "en",
  // the subpath of the site on GitHub Pages
  base: "/dhsn-typst-template/",
  cleanUrls: true,
  lastUpdated: true,
  srcExclude: ["scripts/**"],
  themeConfig: {
    nav: [
      { text: "Quick Start", link: "/quickstart" },
      { text: "Usage", link: "/usage/", activeMatch: "/usage/" },
      { text: "Examples", link: "/examples/", activeMatch: "/examples/" },
      { text: "FAQ", link: "/faq" },
    ],
    sidebar: [
      {
        text: "Introduction",
        items: [
          { text: "Quick Start", link: "/quickstart" },
          { text: "Motivation", link: "/motivation" },
          { text: "Migrating from LaTeX", link: "/migration" },
        ],
      },
      {
        text: "Setup",
        link: "/setup/",
        items: [
          { text: "Typst", link: "/setup/typst" },
          { text: "Template", link: "/setup/template" },
          { text: "Typst Web App", link: "/setup/webapp" },
          { text: "Continuous Integration", link: "/setup/ci" },
        ],
      },
      {
        text: "Usage",
        link: "/usage/",
        items: [
          { text: "Typst Basics", link: "/usage/basics" },
          { text: "Simple Mode", link: "/usage/simple" },
          { text: "Normal Mode", link: "/usage/normal" },
          { text: "Environments", link: "/usage/environments" },
          { text: "Citations", link: "/usage/citations" },
          { text: "Reference", link: "/usage/reference" },
          { text: "Useful Packages", link: "/usage/packages" },
        ],
      },
      {
        text: "Examples",
        link: "/examples/",
        items: [
          { text: "Bachelor Thesis", link: "/examples/thesis" },
          { text: "Report", link: "/examples/report" },
          { text: "Cookbook", link: "/examples/cookbook" },
        ],
      },
      { text: "FAQ", link: "/faq" },
    ],
    outline: [2, 3],
    search: { provider: "local" },
    socialLinks: [{ icon: "github", link: repository }],
    editLink: {
      pattern: repository + "/edit/main/docs/:path",
      text: "Edit this page on GitHub",
    },
    footer: {
      message:
        'Released into the public domain. Based on the <a href="https://github.com/ba-dresden/ba-latex-template">DHSN Dresden LaTeX template</a> by Nuckal777.',
    },
  },
});
