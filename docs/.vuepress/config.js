const path = require("path")

module.exports = {
  title: "TzKT Pro",
  description: "Interactive learning course",
  theme: "vuepress-theme-book",
  head: [
    ['link', { rel: "icon", type: "image/png", sizes: "16x16", href: "/favicon.png"}],
  ],
  themeConfig: {
    logo: "/logo-small.jpg",
    searchPlaceholder: "Search...",
    lastUpdated: "Last Updated",
    docsRepo: "baking-bad/tzkt-pro",
    docsDir: "docs",
    editLinks: false,
    displayAllHeaders: true,
    nav: [
      { text: "Home", link: "/" },
      { text: "Reference", link: "/reference" },
      { text: "Notebooks ", link: "/introduction"},
    ],
    sidebar: [
      ['/reference', 'API reference'],
      {
        title: 'Notebooks',
        collapsable: true,
        sidebarDepth: 1,
        children: [
          ['/introduction', 'Introduction'],
          '/tutorials/01',
        ]
      },
    ]
  },
  plugins: [
    ['autometa', {
      site: {
        name: 'TzKT Pro',
        twitter: 'TezosBakingBad',
      },
      canonical_base: 'https://pro.tzkt.io',
    }],
    ['sitemap', {
      hostname: 'https://pro.tzkt.io'
    }],
    ['@vuepress/google-analytics', {
        'ga': 'UA-131043773-1'
    }],
  ],
  extendMarkdown: md => {
  },
  extendPageData(pageCtx) {    
    if (!pageCtx.frontmatter.title) {
      pageCtx.frontmatter.title = `${pageCtx.title} | Michelson Labs`;

      if (pageCtx._strippedContent) {
        pageCtx.frontmatter.summary = pageCtx._strippedContent
          .split("\n")
          .find(line => line.length > 20 && !line.startsWith("#"))
      }
    }

    pageCtx.frontmatter.image = "/og.png";
    pageCtx.frontmatter.metaTitle = pageCtx.frontmatter.title;
    pageCtx.frontmatter.description = pageCtx.frontmatter.summary
  }
}
