Feature: 注册功能测试

	Background: 前置条件
		Given open site
		

	Scenario Outline: 验证注册功能
		Given visit regist page
		When  input <name_email_passwd_comfirm> with commit
		Then  verify <expect_result>

		Examples: 注册失败的用例
		| name_email_passwd_comfirm | expect_result                      |
		| name_blank                | regist_faild_with_name_blank       |
