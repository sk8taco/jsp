function writeSave(){
	
	if(document.writeform.writer.value==""){/*작성자가 없음*/
	  alert("작성자를 입력하십시요.");
	  document.writeform.writer.focus();
	  return false;
	}
	if(document.writeform.subject.value==""){ /*제목  없음*/
	  alert("제목을 입력하십시요.");
	  document.writeform.subject.focus();
	  return false;
	}
	
	if(document.writeform.content.value==""){ /*내용없음*/
	  alert("내용을 입력하십시요.");
	  document.writeform.content.focus();
	  return false;
	}
        
	if(document.writeform.passwd.value==""){/*비밀번호 없음*/
	  alert(" 비밀번호를 입력하십시요.");
	  document.writeform.passwd.focus();
	  return false;
	}
 }    

