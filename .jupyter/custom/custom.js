// leave at least 2 line with only a star on it below, or doc generation fails
/**
 *
 *
 * Placeholder for custom user javascript
 * mainly to be overridden in profile/static/custom/custom.js
 * This will always be an empty file in IPython
 *
 * User could add any javascript in the `profile/static/custom/custom.js` file
 * (and should create it if it does not exist).
 * It will be executed by the ipython notebook at load time.
 *
 * Same thing with `profile/static/custom/custom.css` to inject custom css into the notebook.
 *
 * Example :
 *
 * Create a custom button in toolbar that execute `%qtconsole` in kernel
 * and hence open a qtconsole attached to the same kernel as the current notebook
 *
 *    $([IPython.events]).on('app_initialized.NotebookApp', function(){
 *        IPython.toolbar.add_buttons_group([
 *            {
 *                 'label'   : 'run qtconsole',
 *                 'icon'    : 'icon-terminal', // select your icon from http://fortawesome.github.io/Font-Awesome/icons
 *                 'callback': function () {
 *                     IPython.notebook.kernel.execute('%qtconsole')
 *                 }
 *            }
 *            // add more button here if needed.
 *            ]);
 *    });
 *
 * Example :
 *
 *  Use `jQuery.getScript(url [, success(script, textStatus, jqXHR)] );`
 *  to load custom script into the notebook.
 *
 *    // to load the metadata ui extension example.
 *    $.getScript('/static/notebook/js/celltoolbarpresets/example.js');
 *    // or
 *    // to load the metadata ui extension to control slideshow mode / reveal js for nbconvert
 *    $.getScript('/static/notebook/js/celltoolbarpresets/slideshow.js');
 *
 *
 * @module IPython
 * @namespace IPython
 * @class customjs
 * @static
 */
// IPython.load_extensions('gist');
// IPython.load_extensions('toc');

// require(["nbextensions/toc"], function (toc) {
// console.log('Table of Contents extension loaded');
// toc.load_ipython_extension();
// // If you want to load the toc by default, add:
// $([IPython.events]).on("notebook_loaded.Notebook", toc.table_of_contents);
// });
//
// // IPython.load_extensions('rubberband/main')
//
//
//
//
// // https://github.com/lambdalisue/jupyter-vim-binding
//
// #<{(| Jupyter cell is in normal mode when code mirror |)}>#
// .edit_mode .cell.selected .CodeMirror-focused.cm-fat-cursor {
//   background-color: #F5F6EB;
// }
// #<{(| Jupyter cell is in insert mode when code mirror |)}>#
// .edit_mode .cell.selected .CodeMirror-focused:not(.cm-fat-cursor) {
//   background-color: #F6EBF1;
// }



// Configure CodeMirror
require(['codemirror/keymap/vim'], function() {
  // Map jj to <Esc>
  // CodeMirror.Vim.map("jj", "<Esc>", "insert");
  // Use gj/gk instead of j/k
  // CodeMirror.Vim.map("j", "gj", "normal");
  // CodeMirror.Vim.map("k", "gk", "normal");
  CodeMirror.Vim.map("<C-c>", "<Esc>", "insert");
});
// Configure Jupyter (VimBinding)
// require(['base/js/namespace'], function(namespace) {
  // var cs = namespace.keyboard_manager.command_shortcuts;
  // console.log("hello");
  // console.log(km);
  // debugger;
  
  // cs.set_shortcut('j', 'ipython.select-next-cell')
  
  // namespace.VimBinding = namespace.VimBinding || {};
  // // Regulate scroll speed (default: 30)
  // namespace.VimBinding.scrollUnit = 100;
  // // Regulate offset (default: 30)
  // namespace.VimBinding.closestCellMargin = 5;
// });
