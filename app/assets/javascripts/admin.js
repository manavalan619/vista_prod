//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require popper
//= require bootstrap-sprockets
//= require cocoon
//= require core-ui
//= require rowlink
//= require select2.min
//= require jquery.fn.sortable
//= require notify
//= require sortable
//= require questions
//= require categories
//= require trix
//= require trix-uploads
//= require datepicker
//= require datepicker.en
//= require jquery.remotipart
//= require cable
//= require debounce
//= require turbolinks
//= require turbolinks-compat

$(function() {
  $('.dropdown-toggle').dropdown();
  // $('select').select2();

  $('select').each(function() {
    if ($(this).data('url')) {
      var url = $(this).data('url');

      $(this).select2({
        ajax: {
          url: url,
          dataType: 'json',
          data: function (params) {
            var query = {
              q: params.term
            }

            // Query parameters will be ?q=[term]
            return query;
          },
          processResults: function(data, params) {
            return {
              results: data.map(function(q) {
                return {
                  id: q.id,
                  text: q.title
                }
              })
            }
          },
          cache: true
        }
      });
    } else {
      $(this).select2();
    }
  });

  $('.rowlink').rowlink();
  $('.datetimepicker').datepicker({
    language: 'en',
    timepicker: true,
    minDate: new Date(),
    todayButton: new Date(),
    clearButton: true,
    dateFormat: 'yyyy-mm-dd',
    timeFormat: 'hh:ii'
  });
});

var debouncedSubmit = debounce(function() {
  $('form.filters').trigger('submit.rails');
}, 250);

$(document).on('change', 'form.filters', function() {
  $(this).trigger('submit.rails');
});

$(document).on('input', 'form.filters input', function() {
  debouncedSubmit()
});

$(document).on('input', '.file-input', function(e) {
  var input = $(this)[0];
  var filename = $(this).siblings('.file-name');

  if (input.files.length > 0) {
    filename.html(input.files[0].name);
  }
});
