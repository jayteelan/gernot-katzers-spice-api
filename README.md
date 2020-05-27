# Gernot Katzer’s Spice API

[Gernot Katzer’s Spice Pages](http://gernot-katzers-spice-pages.com/engl/index.html) is a long-standing and exceptionally comprehensive source of information on culinary spices and herbs from around the world. In addition to numerous photographs of each spice and notes on dishes in which they can be found, Katzer provides
extensive and well-written ethnobotanical background information, including organoleptic analyses, etymologies of their names in various languages, and breakdowns of which compounds contribute to each spice’s aroma. This is all the more impressive when one considers how long the site has been online - though the last documented update was in 2006, the layout suggests (and my own personal history with the site confirms) that it has been around even longer. While the site no longer relies on frames (_dude, who else remembers frames?_), the pages are still static with all of the valuable information hard-coded in HTML4 and styled in CSS 2.

**Gernot Katzer’s Spice API** represents an effort to make Katzer’s research more accessible to contemporary developers and citizens of the internet with a RESTful API built in Ruby on Rails. Given Katzer’s limited availability for contact, this project will rely heavily on web scraping to populate data tables in its initial stages. Conveniently, I’d been searching for a way to keep busy and keep my coding chops honed while trying to find work during COVID-19 lockdown...

## Change log

### 27. May, 2020

- began crawling spice pages from English spice index page; scraping is hindered by inconsistent page layout and limited use of class names on HTML tags.

#### 21. May, 2020

- project initialized with a basic web scraper for the [English spice index page](http://gernot-katzers-spice-pages.com/engl/spice_small.html)
