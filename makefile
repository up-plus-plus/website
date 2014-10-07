SASS=sass --no-cache --style=compressed
HAML=haml --style ugly

CSS=$(filter-out www/static/_%.css, $(patsubst %.sass,%.css,$(wildcard www/static/*.sass)))
HTML=$(patsubst %.haml,%.html,$(wildcard www/*.haml))

.PHONY=build clean publish

build: clean $(CSS) $(HTML)

%.css: %.sass
	$(SASS) $<:$@

%.html: %.haml
	$(HAML) $< $@

clean:
	-$(RM) $(HTML)
	-$(RM) static/*.css
	-$(RM) static/*.css.map

publish: build
	cp CNAME output
	cp $(HTML) output
	mkdir -p output/static
	cp $(CSS) output/static
	mkdir -p output/img
	cp $(wildcard www/img/*) output/img
	cd output; git add -A; git commit -m "published `date --iso=minutes`"; git push origin master
