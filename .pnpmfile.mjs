export const hooks = {
  updateConfig (config) {
    // Select one project by its path, relative to the workspace root.
    return Object.assign(config, { filter: config.filter ?? ['./packages/app'] })
  },
}
