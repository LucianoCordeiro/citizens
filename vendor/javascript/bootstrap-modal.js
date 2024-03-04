var e={name:"bootstrap-modal",version:"2.2.4",description:"Bootstrap Modal (w/ animation) addon for Ember CLI",keywords:["ember-addon","bootstrap","modal","animation","ember","ui"],repository:"https://github.com/knownasilya/bootstrap-modal",license:"MIT",author:"Ilya Radchenko",directories:{doc:"doc",test:"tests"},scripts:{build:"ember build","lint:hbs":"ember-template-lint .","lint:js":"eslint .",start:"ember serve",test:"ember test","test:all":"ember try:each",deploy:"ember deploy production",release:"standard-version"},dependencies:{"ember-cli-babel":"^7.1.2","ember-cli-htmlbars":"^3.0.0","liquid-wormhole":"^2.1.5"},devDependencies:{"@ember/jquery":"^0.5.2","@ember/optional-features":"^0.7.0",bootstrap:"^3.4.0","broccoli-asset-rev":"^3.0.0","ember-angle-bracket-invocation-polyfill":"^1.2.3","ember-cli":"~3.6.0","ember-cli-dependency-checker":"^3.0.0","ember-cli-deploy":"^1.0.2","ember-cli-deploy-build":"^1.1.1","ember-cli-deploy-git":"^1.3.3","ember-cli-eslint":"^5.0.0","ember-cli-htmlbars-inline-precompile":"^2.1.0","ember-cli-inject-live-reload":"^2.0.1","ember-cli-template-lint":"^1.0.0-beta.1","ember-cli-uglify":"^2.1.0","ember-disable-prototype-extensions":"^1.1.3","ember-export-application-global":"^2.0.0","ember-load-initializers":"^2.0.0","ember-maybe-import-regenerator":"^0.1.6","ember-qunit":"^4.2.0","ember-resolver":"^5.0.1","ember-semantic-test-helpers":"^0.2.1","ember-source":"~3.6.0","ember-source-channel-url":"^1.1.0","ember-try":"^1.0.0","eslint-plugin-ember":"^6.1.0","eslint-plugin-node":"^8.0.0","liquid-fire":"^0.29.5","loader.js":"^4.7.0","qunit-dom":"^0.8.0","standard-version":"^4.3.0"},engines:{node:"6.* || 8.* || >= 10.*"},peerDependencies:{"liquid-fire":">= 0.26.0"},"ember-addon":{configPath:"tests/dummy/config"}};var r={};r={name:e.name,included(e){this._super.included(e);"function"!==typeof e.import&&e.app&&(e=e.app);e.import("vendor/bootstrap-modal/styles.css")}};var i=r;const t=r.name;export default i;export{t as name};

