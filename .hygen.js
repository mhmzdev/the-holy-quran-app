module.exports = {
  helpers: {
    widgetsToShell: (screen, widgets) => {
      return widgets
        .map((key) => `hygen screen widget ${key} --screen=${screen}`)
        .join(' && ');
    },
    widgetsToShell2: (screen, widgets) => {
      return widgets
        .map((key) => `hygen screen widget2 ${key} --screen=${screen}`)
        .join(' && ');
    },
  },
};
