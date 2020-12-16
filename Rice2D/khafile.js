let project = new Project('Rice2D2');
project.addSources('Sources');
project.addAssets('Assets/**');
project.addDefine('analyzer-optimize');
resolve(project);