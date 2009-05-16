  //是否为空检查
  function notNull(s,msg){
	if   ($(s).val().length==0) {
		alert((msg?msg:"该栏不能为空"));  
		$(s).focus();   
		$(s).select();
		return false;
	}
	return true;
  }
  //只能输入标准的e-mail邮件格式 
  function   isemail(s,msg){   
	  if   ($(s).val().length==0)return   false;   
		  var   reg   =  /^[a-z0-9]([a-z0-9_\-\.]*)@([a-z0-9_\-\.]*)(\.[a-z]{2,3}(\.[a-z]{2}){0,2})$/i;
		  if   (reg.test($(s).val()))return   true;   
		  else   {   
		  alert((msg?msg:"请输入标准的e-mail邮件格式，例如test@163.net"));   
		  $(s).focus();   
		  $(s).select()   
		  return   false;   
	  }   
  }
    //只能输入数字   
  function   isnumeric(s,msg){ 
	  if   ($(s).val()*1!=$(s).val()){   
		  alert((msg?msg:"该栏只能输入数字﹐请改正"))   
		  $(s).focus();   
		  $(s).select()   
		  return   false   
	  }   
	  return   true   
  } 