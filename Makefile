# Build
OPEN_PROMPT = "All done! \
							Do you want to see it in a browser now? "

release:
		@harp compile
		@echo "Compiled static files"
		@cp README.md www
		@echo 'www.gibreimschussel.com' > www/CNAME
		@cd www && \
			git init && \
			git add . && \
			git commit --allow-empty -m 'Static compilation of https://github.com/gib/s4g' && \
			git remote add origin git@github.com:gib/gibify.git && \
			git push --force origin gh-pages
		@echo "Pushed to github gibify, gh-pages branch"
		@echo "Cleaning up..."
		@rm -rf www
		@echo ''
		@read -p $(OPEN_PROMPT) response; \
			if [ $$response == 'y' ] ; \
			then open http://gib.github.io/gibify ; \
			else echo "\nCool. Take it easy!\n" ; fi
