let project = new Project('Game');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addShaders('Shaders/**');
await project.addProject('Rice2D');
resolve(project);