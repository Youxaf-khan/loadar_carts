/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      {
        loadar: {
          "color-scheme": "light",
          primary: "rgb(22, 163, 74)",
          "primary-content": "#fff",
          secondary: "oklch(69.71% 0.329 342.55)",
          "secondary-content": "oklch(98.71% 0.0106 342.55)",
          accent: "oklch(76.76% 0.184 183.61)",
          neutral: "#2B3440",
          "neutral-content": "#D7DDE4",
          "base-100": "oklch(100% 0 0)",
          "base-200": "#F2F2F2",
          "base-300": "#E5E6E6",
          "base-content": "#1f2937",
        },
      },
    ],
  },
}
