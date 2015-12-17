var RegForm = function () {

    return {
        
        //Registration Form
        initRegForm: function () {
	        // Validation       
	        $("#sky-form4").validate({                   
	            // Rules for form validation
	            rules:
	            {
	            	mem_phone:
	            	{
	            		required: true
	            	},
	                mem_name:
	                {
	                    required: true,
	                    maxlength: 4  
	                },
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
	                },
	                passwordConfirm:
	                {
	                    required: true,
	                    minlength: 8,
	                    maxlength: 15,
	                    equalTo: '#password'
	                },
	                firstname:
	                {
	                    required: false
	                },
	                lastname:
	                {
	                    required: false
	                },
	                gender:
	                {
	                    required: false
	                },
	                terms:
	                {
	                    required: true
	                },
	                description:
	                {
	                	required: true
	                },
	                interestValue:
	                {
	                	required: false
	                }
	            },
	            
	            // Messages for form validation
	            messages:
	            {
	            	mem_phone:
	            	{
	            		required: '전화번호를 입력해주세요.'
	            	},
	            	mem_name:
		            {
	            		required: '고객님의 성함을 입력해주세요.'
		            },
	                login:
	                {
	                    required: '고객님의 계정으로 로그인해주세요.'
	                },
	                mem_email:
	                {
	                    required: '사용하실 이메일(계정)을 입력해주세요.',
	                    email: '이메일 형식이 올바르지 않습니다.'
	                },
	                mem_pwd:
	                {
	                    required: '사용하실 비밀번호를 입력해주세요.'
	                },
	                passwordConfirm:
	                {
	                    required: '사용하실 비밀번호를 한번 더 입력해주세요.',
	                    equalTo: '비밀번호가 같지 않습니다.'
	                },
	                firstname:
	                {
	                    required: 'Please select your first name'
	                },
	                lastname:
	                {
	                    required: 'Please select your last name'
	                },
	                gender:
	                {
	                    required: 'Please select your gender'
	                },
	                terms:
	                {
	                    required: '개인정보 활용에 동의해주세요.'
	                },
	                description:
	                {
	                	required: '이용약관에 동의해주세요.'
	                },
	                interestValue:
	                {
	                	required: '관심분야를 1개 이상 선택해주세요.'
	                }  
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