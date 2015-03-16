$(function() {
  var initialSettings
  initialSettings = {
    resizeHandle: 'false',

    nameSpace: 'markdownEditor',
    markupSet: [
      { name:'Heading 1', openWith:'# ', placeHolder:'Title...' },
      { name:'Heading 2', openWith:'## ', placeHolder:'Title...' },
      { name:'Heading 3', openWith:'### ', placeHolder:'Title...' },
      { name:'Heading 4', openWith:'#### ', placeHolder:'Title...' },
      { name:'Heading 5', openWith:'##### ', placeHolder:'Title...' },
      { name:'Heading 6', openWith:'###### ', placeHolder:'Title...' },

      { separator:'---------------' },

      {name: 'Horizontal line', openWith:'\n***\n' },
      {name: 'Bold',            openWith:'**', closeWith:'**' },
      {name: 'Italic',          openWith:'_',  closeWith:'_' },
      {name: 'Italic',          openWith:'*',  closeWith:'*' },
      {name: 'Stroke',          openWith:'~~', closeWith:'~~' },

      { separator:'---------------' },

      { name:'Bulleted List', openWith:'- ' },
      { name:'Numeric List',
          openWith: function( markItUp ) {
            return markItUp.line+'. ';
          }
      },

      { separator:'---------------' },

      { name:'Picture', replaceWith:'![[![Alternative text]!]]([![Url:!:http://]!] "[![Title]!]")' },
      { name:'Link', openWith:'[', closeWith:']([![Url:!:http://]!] "[![Title]!]")', placeHolder:'Your text to link here...' },

      { separator:'---------------' },

      { name: 'Code Block / Codees',
          className: 'code_insertion',
          key:'J',
          beforeInsert: function() {
            $('#codeInsertionModal').show();
          }
      },
      { name: 'Inline code', key:'K', openWith:'<code>', closeWith:'</code>' }
    ]
  };

  var codeInsertionModal = $('#codeInsertionModal'),
      string_to_parse = '',
      no_number = codeInsertionModal.find('.no_numbers'),
      cut = codeInsertionModal.find('.cut'),
      language = codeInsertionModal.find('.language'),
      title = codeInsertionModal.find('.title'),
      link = codeInsertionModal.find('.link'),
      highlight = codeInsertionModal.find('.highlight'),
      start_from = codeInsertionModal.find('.start_from');

  $('.code_insertion').on('click', function(){
    codeInsertionModal.show();
    return false;
  });

  codeInsertionModal.find('.clear').on('click', function(){
    no_number.prop('checked', false),
    cut.prop('checked', false),
    language.val('');
    title.val('');
    link.val('');
    highlight.val('');
    start_from.val('');

    return false;
  });

  codeInsertionModal.find('.cancel').on('click', function(){
    codeInsertionModal.hide();
    return false;
  });

  codeInsertionModal.find('.save').on('click', function(){
    if ( no_number.prop('checked') ){
      string_to_parse = 'lang===' + language.val() + '###no_numbers===true'

      if ( title.val() ){
        string_to_parse += '###title===' + title.val()

        if ( cut.prop('checked') ){
          string_to_parse += '###cut===cut'
        }
      }

      if ( link.val() ){
        string_to_parse += '###link===' + link.val()
      }

    } else {
      string_to_parse = 'lang===' + language.val();

      if ( title.val() ){
        string_to_parse += '###title===' + title.val()

        if ( cut.prop('checked') ){
          string_to_parse += '###cut===cut'
        }
      }

      if ( link.val() ){
        string_to_parse += '###link===' + link.val()
      }

      if ( highlight.val() ){
        string_to_parse += '###highlight===' + highlight.val()
      }

      if ( start_from.val() ){
        string_to_parse += '###start_from===' + start_from.val()
      }
    }

    $.markItUp({
      openWith:'\n~~~ ' + string_to_parse + '\n',
      closeWith: '\n~~~\n'
    });

    $('#codeInsertionModal').hide();
    return false;
  });

  $('textarea').markItUp(initialSettings);  
});
