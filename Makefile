# Build
OPEN_PROMPT = "All done! \
							Do you want to see it in a browser now? "

release:
		@harp compile
		@echo "Compiled static files"
		@cp README.md www
		@cd www && \
			git init && \
			git checkout -b gh-pages && \
			git add . && \
			git commit --allow-empty -m 'Static compilation of gibify' && \
			git remote add origin git@github.com:gib/gibify.git && \
			git push --force origin gh-pages
		@echo "Pushed to github gibify, gh-pages branch"
		@echo "Cleaning up..."
		@rm -rf www
		@echo ''
		@read -p $(OPEN_PROMPT) response; \
			if [ $$response == 'y' ] ; \
			then open https://gib.github.io/gibify ; \
			else echo "\nCool. Take it easy!\n" ; fi
