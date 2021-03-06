var LoginForm = function () {

    return {
        
        //Masking
        initLoginForm: function () {
	        // Validation for login form
	        $("#sky-form1").validate({
	            // Rules for form validation
	            rules:
	            {
	                mem_email:
	                {
	                    required: true,
	                    email: true
	                },
	                mem_pwd:
	                {
	                    required: true,
	                    minlength: 8,
	                    maxlength: 15
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	                mem_email:
	                {
	                    required: '이메일 주소를 입력해주세요.',
	                    email: '이메일 형식이 올바르지 않습니다.'
	                },
	                mem_pwd:
	                {
	                    required: '비밀번호를 입력해주세요.'
	                }
	            },                  
	            
	            // Do not change code below
	            errorPlacement: function(error, element)
	            {
	                error.insertAfter(element.parent());
	            }
	        });
	        
	        // Validation for recovery form
	        $("#sky-form2").validate({
	            // Rules for form validation
	            rules:
	            {
	                mem_email:
	                {
	                    required: true,
	                    email: true
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	                mem_email:
	                {
	                    required: '이메일 주소를 입력해주세요.',
	                    email: '이메일 형식이 올바르지 않습니다.'
	                }
	            },
	                                
	            // Ajax form submition                  
	            submitHandler: function(form)
	            {
	                $(form).ajaxSubmit(
	                {
	                    success: function()
	                    {
	                        $("#sky-form2").addClass('submited');
	                    }
	                });
	            },              
	            
	            // Do not change code below
	            errorPlacement: function(error, element)
	            {
	                error.insertAfter(element.parent());
	            }
	        });
        }

    };

}();