

## Roadmap

#### docs/examples
- [x] hstack/vstack for variable number of inputs too
- [ ] README generated by Term like Rich's
- [x] improved logo
- [ ] docs
  - [ ] installation
  - [ ] basic usage
  - [ ] macros
  - [ ] textbox/panels + nesting
  - [ ] layout: stacking + layout objects
  - [ ] inspect


#### features
- [ ] titleline : hLine with title centered in the middle

- [ ] error's traceback
  - [ ] keep adding more error types
  - [ ] captures errors during error genereation
- [ ] logging
- [ ] pretty print common data structures
  - [x] highlight type info ::Type or <:Type
- [ ]  style by regex by applying style to each match
- [ ] tree visualization
    - [ ] type hierarchy tree for `inspect` (https://towardsdatascience.com/runtime-introspection-julias-most-powerful-best-kept-secret-bf845e282367)
  

#### possible future features/improvements
- [ ] `Console` like object using `displaysize()` to get width
- [ ] allow things like Panel and TextBox to `fill` their parent and `fit` their content.

- [ ] latex->unicode parsing (https://github.com/phfaist/pylatexenc)
- [ ] markdown parsing
- [ ] code syntax highlighting

## known bugs (and currently brocken stuff)
- [ ] when highlighting with multiple styles something is still brocken
- [ ] when applying markup occasionally out of bounds error



--------------

### Done
- [x] inspect
  - [x] type/struct inspection
  - [x] method inspection

- [x] `tprint`
- [x] macros for styling a string

- [x] box
- [x] panel
  - [x] panel subtitle (new make line method)

- [x] get plain text for Measure
  - [x] remove markup
  - [x] remove ansi
  
- [x] regex markup extraction
  - [x] deal with no or minmal closings
  - [x] test

- [x] color: test detection
  - [x] print all named colors
  - [x] test
  - [x] hex -> rgb

- [x] markup -> ansi substitution, modular
  - [x] detect style
  - [x] inject style
    - [x] all colors
  - [ ] fix bug with nested tags
  
- [x] segment
  - [x] base
  - [x] from string + style
  - [x] from string + markup

- [x] tests
  - [x] check that Measure is correct for all types of segment, segments, renderable...
  - [x] also check results make sense when concatenating them

- [x] panel
  - [x] base features
  - [x] subtitle
  
- [x] textbox (panel of given size with hidden edges + text inside)
  - [x] have textbox accept multiple lines of inputs as variable number of strings
- [x] vLine/hLine and spacer

#### fixed bugs(for now)
- [x] style: if a tag is at the beginning of a multiline string, it should be repeated on each line?
- [x] panel: style's mode applies to title too.
- [x] `textbox` a bit buggy, produces weird output occasionally
- `Panel` can't handle renderables larger than given width
- [x] When splitting markup text over multiple lines,  the wrong tag is carried over
- [x] nested tags, outer's color/bg not correctly restored
  - [x] mostly fixed though mode tags don't carry over correctly all the time
- [x] `highlight`, nested highlighting with hex code colors doesn't restore outer colors
- [x] multiple styles on same line, text in between not rendered correctly
- [x] `clean_nested_tags` breaks Panel
- [x] `inspect` cannot print panels due to BonudsError
  - [x] error in `reshape` text with style
- [x] `Panel`: not sure that it has correct width