SASS=sass --no-cache --style=compressed
HAML=haml --style ugly

CSS=$(filter-out www/static/_%.css, $(patsubst %.sass,%.css,$(wildcard www/static/*.sass)))
HTML=$(patsubst %.haml,%.html,$(wildcard www/*.haml))

.PHONY=build clean

build: clean $(CSS) $(HTML)

%.css: %.sass
	$(SASS) $<:$@

%.html: %.haml
	$(HAML) $< $@

clean:
	-$(RM) $(HTML)
	-$(RM) static/*.css
	-$(RM) static/*.css.map

