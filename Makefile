install:
	raco pkg install sicp
	raco pkg install review

test:
	# raco test sicp
	raco test sicp/chapter2

lint:
	@echo "check codestyle"
	@(for f in $$(find sicp -name '*.rkt'); do raco review $$f; done)

.PHONY: test
