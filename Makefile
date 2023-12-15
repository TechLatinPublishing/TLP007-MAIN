.PHONY: clean-submodule add-submodule clean rebuildSM makeNetlify

clean-submodule:
	@echo "Cleaning submodule..."
	@rm -rf .git/modules/themes/TH006-beautifulhugo
	@if git config --get-regexp '^submodule\.themes/TH006-beautifulhugo\.' >/dev/null 2>&1; then \
		git config --remove-section submodule.themes/TH006-beautifulhugo; \
		echo "Submodule configuration removed."; \
	else \
		echo "Submodule configuration not found."; \
	fi
	@rm -rf themes/TH006-beautifulhugo
	@echo "Submodule directory removed."
	@echo "Submodule cleaned."

add-submodule:
	@echo "Re-adding submodule..."
	@git submodule add -b Dev001 -f https://github.com/TechLatinPublishing/TH006-beautifulhugo themes/TH006-beautifulhugo
#	@git submodule add -f https://github.com/TechLatinPublishing/TH006-beautifulhugo themes/TH006-beautifulhugo
	@echo "Submodule re-added."


rebuildSM: clean-submodule add-submodule
	@echo "Submodule cleaned and re-added."

clean: clean-submodule
	@echo "Cleaning Modules for git"
	go mod tidy
	@echo "Main modules cleaned."


makeNetlify:clean-submodule add-submodule clean
	@echo "Running makeNetlify"
	@echo "running hugo "
	hugo -e production
	@echo "Built hugo"




