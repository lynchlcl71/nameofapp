function buildSectionLinks(){
	// add anchor links to exercise content above h4 tags, excluding modals
	$('#day_contents h4:not(.heading):not(.modal-text)').each(function(index){
		anchor = getSlug($(this).text());
		$(this).before('<a id="' + anchor + '"></a>');
		// add menu links to anchor tags
		if($(this).text() == "Task"){
			link = '<li><a href="#'+ anchor + '" class="section-link"><div class="course_menu_dot task"></div><span class="course_menu_text">' + $(this).text() + '</span></a></li>';
		} else {
			link = '<li><a href="#'+ anchor + '" class="section-link"><div class="course_menu_dot"></div><span class="course_menu_text">' + $(this).text() + '</span></a></li>';
		}
		$('#section-links').append(link);
	});
}

function validateHighlight(text){
	if(text.length > 2){
		if(text.indexOf('\n') > 0){
			return false;
		}else{
			return true;
		}
	}else{
		return false;
	}
}

function containsCode(txt){
	return txt.indexOf("</") > 0 || txt.indexOf("=\"") > 0 || txt.indexOf("()") > 0 || txt.indexOf("px;") > 0 || txt.indexOf("%=") > 0 ||  txt.indexOf("==") > 0 ||  txt.indexOf("git add") > 0 || txt.indexOf("rails generate") > 0 || txt.indexOf("heroku run") > 0 || txt.indexOf("/*") > 0;
}

function ajaxSaveForm(formclass){
	$('.ajax-loader').hide();
	$(formclass).on('ajax:send', function(event, data, status, xhr) {
		$('#ajax-loader').hide();
		$(this).find(':submit').fadeTo("fast",0.5);
		$(this).find('.ajax-loader').show();
	});
	$(formclass).on('ajax:success', function(event, data, status, xhr) {
		$(this).find(':submit').fadeTo("fast",1);
		$(this).find('.ajax-loader').hide();
	});
}

function expand (id){
  var elem = document.getElementById(id);
  elem.rows = 10;
}

function upload_submission(val) {
  document.getElementById("uploadFile").innerHTML = val.replace(/^.*[\\\/]/, '');
  document.getElementById("upload_name").innerHTML = "Change file";
  document.getElementById("upload_btn").className = "fileUpload btn btn-default";
  document.getElementById("upload_submit").style.display = "inline";
}

function toggle_visibility(id) {
  var e = document.getElementById(id);
  if(e.style.display == 'block')
    e.style.display = 'none';
  else
    e.style.display = 'block';
}

/*--- NOTES ---*/

function new_note(section_id){
  show_comments('note_text_' + section_id);
  //$("#note_icon_" + section_id).addClass("highlight_text");
  //$('#section_' + section_id + ' p').addClass("highlight");
}

function edit_note(section_id){
  show_comments('note_text_' + section_id);
}
