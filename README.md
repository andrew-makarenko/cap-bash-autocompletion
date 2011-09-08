Capistrano tasks bash autocompletion
===============================

Installation
-------------
Add to your ~/.bashrc this line:
###### 
	complete -C /path/to/script/autocompletion/capistrano.rb -o default cap

###### That's all folks!
	andrew@andrew-K52F:~/Projects/trader$ cap de
	deploy                deploy:pending:diff   deploy:update
	deploy:check          deploy:rollback       deploy:update_code
	deploy:cleanup        deploy:rollback:code  deploy:upload
	deploy:cold           deploy:setup          deploy:web:disable
	deploy:migrate        deploy:start          deploy:web:enable
	deploy:migrations     deploy:stop           development
	deploy:pending        deploy:symlink        
