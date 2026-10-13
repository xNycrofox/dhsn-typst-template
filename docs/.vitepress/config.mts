import { defineConfig } from "vitepress";

const repository = "https://github.com/xNycrofox/dhsn-typst-template";
const latexTemplate = "https://github.com/ba-dresden/ba-latex-template";

// labels of the navigation in each language
const labels = {
  en: {
    quickstart: "Quick Start",
    usage: "Usage",
    examples: "Examples",
    faq: "FAQ",
    introduction: "Introduction",
    motivation: "Motivation",
    migration: "Migrating from LaTeX",
    setup: "Setup",
    typst: "Typst",
    template: "Template",
    webapp: "Typst Web App",
    ci: "Continuous Integration",
    basics: "Typst Basics",
    simple: "Simple Mode",
    normal: "Normal Mode",
    environments: "Environments",
    citations: "Citations",
    reference: "Reference",
    packages: "Useful Packages",
    thesis: "Bachelor Thesis",
    report: "Report",
    cookbook: "Cookbook",
  },
  de: {
    quickstart: "Schnellstart",
    usage: "Benutzung",
    examples: "Beispiele",
    faq: "FAQ",
    introduction: "Einführung",
    motivation: "Motivation",
    migration: "Umstieg von LaTeX",
    setup: "Einrichtung",
    typst: "Typst",
    template: "Template",
    webapp: "Typst Web App",
    ci: "Continuous Integration",
    basics: "Typst-Grundlagen",
    simple: "Einfacher Modus",
    normal: "Normaler Modus",
    environments: "Umgebungen",
    citations: "Zitate",
    reference: "Referenz",
    packages: "Nützliche Pakete",
    thesis: "Bachelorarbeit",
    report: "Belegarbeit",
    cookbook: "Kochbuch",
  },
};

// navigation and sidebar, prefix is "" for english and "/de" for german
function navigation(prefix: string, t: typeof labels.en) {
  return {
    nav: [
      { text: t.quickstart, link: `${prefix}/quickstart` },
      { text: t.usage, link: `${prefix}/usage/`, activeMatch: `${prefix}/usage/` },
      { text: t.examples, link: `${prefix}/examples/`, activeMatch: `${prefix}/examples/` },
      { text: t.faq, link: `${prefix}/faq` },
    ],
    sidebar: [
      {
        text: t.introduction,
        items: [
          { text: t.quickstart, link: `${prefix}/quickstart` },
          { text: t.motivation, link: `${prefix}/motivation` },
          { text: t.migration, link: `${prefix}/migration` },
        ],
      },
      {
        text: t.setup,
        link: `${prefix}/setup/`,
        items: [
          { text: t.typst, link: `${prefix}/setup/typst` },
          { text: t.template, link: `${prefix}/setup/template` },
          { text: t.webapp, link: `${prefix}/setup/webapp` },
          { text: t.ci, link: `${prefix}/setup/ci` },
        ],
      },
      {
        text: t.usage,
        link: `${prefix}/usage/`,
        items: [
          { text: t.basics, link: `${prefix}/usage/basics` },
          { text: t.simple, link: `${prefix}/usage/simple` },
          { text: t.normal, link: `${prefix}/usage/normal` },
          { text: t.environments, link: `${prefix}/usage/environments` },
          { text: t.citations, link: `${prefix}/usage/citations` },
          { text: t.reference, link: `${prefix}/usage/reference` },
          { text: t.packages, link: `${prefix}/usage/packages` },
        ],
      },
      {
        text: t.examples,
        link: `${prefix}/examples/`,
        items: [
          { text: t.thesis, link: `${prefix}/examples/thesis` },
          { text: t.report, link: `${prefix}/examples/report` },
          { text: t.cookbook, link: `${prefix}/examples/cookbook` },
        ],
      },
      { text: t.faq, link: `${prefix}/faq` },
    ],
  };
}

export default defineConfig({
  title: "DHSN Typst Template",
  // the subpath of the site on GitHub Pages
  base: "/dhsn-typst-template/",
  cleanUrls: true,
  lastUpdated: true,
  srcExclude: ["scripts/**"],
  themeConfig: {
    outline: [2, 3],
    search: {
      provider: "local",
      options: {
        locales: {
          de: {
            translations: {
              button: { buttonText: "Suchen", buttonAriaLabel: "Suchen" },
              modal: {
                noResultsText: "Keine Ergebnisse für",
                resetButtonTitle: "Suche zurücksetzen",
                footer: { selectText: "auswählen", navigateText: "navigieren", closeText: "schließen" },
              },
            },
          },
        },
      },
    },
    socialLinks: [{ icon: "github", link: repository }],
  },
  locales: {
    root: {
      label: "English",
      lang: "en",
      description: "Typst template implementing the DHSN Dresden Styleguide",
      themeConfig: {
        ...navigation("", labels.en),
        editLink: {
          pattern: `${repository}/edit/main/docs/:path`,
          text: "Edit this page on GitHub",
        },
        footer: {
          message: `Released into the public domain. Based on the <a href="${latexTemplate}">DHSN Dresden LaTeX template</a>.`,
        },
      },
    },
    de: {
      label: "Deutsch",
      lang: "de",
      description: "Typst-Template nach dem Leitfaden der DHSN Dresden",
      themeConfig: {
        ...navigation("/de", labels.de),
        editLink: {
          pattern: `${repository}/edit/main/docs/:path`,
          text: "Diese Seite auf GitHub bearbeiten",
        },
        footer: {
          message: `Gemeinfrei veröffentlicht. Basiert auf dem <a href="${latexTemplate}">LaTeX-Template der DHSN Dresden</a>.`,
        },
        outline: { level: [2, 3], label: "Auf dieser Seite" },
        docFooter: { prev: "Vorherige Seite", next: "Nächste Seite" },
        lastUpdated: { text: "Zuletzt aktualisiert" },
        darkModeSwitchLabel: "Darstellung",
        lightModeSwitchTitle: "Zum hellen Design wechseln",
        darkModeSwitchTitle: "Zum dunklen Design wechseln",
        sidebarMenuLabel: "Menü",
        returnToTopLabel: "Nach oben",
        langMenuLabel: "Sprache ändern",
      },
    },
  },
});
