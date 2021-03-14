
// summernote-rails
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require summernote/summernote-bs4.min
//= require activestorage
//= require turbolinks
//= require_tree .

// Loads all Semantic javascripts
//= require semantic-ui

// ドロップダウンを使用するためのコード
$(document).on('turbolinks:load', function() {
    $(function() {
        $('.ui.dropdown').dropdown();
    });
});


// summernoteの初期設定
$(document).on('turbolinks:load', function() {
    $('[data-provider="summernote"]').each(function() {
        $(this).summernote({
            lang: 'ja-JP',
            height: 300,
        });
    });
});