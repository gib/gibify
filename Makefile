# Build
OPEN_PROMPT = "All done! \
							Do you want to see it in a browser now? "

release:
		@harp compile
		@echo "Compiled static files"
		@cp README.md www
		@cd www && \
			git init && \
			git add . && \
			git commit --allow-empty -m 'Static compilation of https://github.com/gib/www.shortforgilbert.com' && \
			git remote add origin git@github.com:gib/gib.github.io.git && \
			git push --force origin master
		@echo "Pushed to gib.github.io"
		@echo "Cleaning up..."
		@rm -rf www
		@echo ''
		@read -p $(OPEN_PROMPT) response; \
			if [ $$response == 'y' ] ; \
			then open http://gib.github.io ; \
			else echo "\nCool. Take it easy!\n" ; fi