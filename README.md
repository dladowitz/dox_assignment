## Doximity's Assignment

### Setup

Run `bin/setup` and then boot the app with `rails server`

### Running Tests

Run `rake test`

### Styling

Browse to `/components` for guidance

------------

## Assignment Instructions

* If you are applying for the Junior engineering position you must complete stories stories 1, and either 2a **or** 2b. Otherwise complete stories 1 and 3.
* Clone this repository, create a local git branch and commit your changes to said branch
* **DO NOT PUSH TO MASTER**, **DO NOT FORK THE REPOSITORY**
* Code Style Guide can be found [here](https://github.com/bbatsov/ruby-style-guide), use 2 soft-tabs.
* * Push branch to github
* Once work is completed, create a new [Pull Request](https://github.com/doximity/blgr2/compare) between master and your branch
* Leave a comment on your pull request notifying `@brupm` you have completed the assignment


### Story 1
```
Story Title: As a reader I would like to search the blog so
that I can find articles which interest me.

Description: Provide a front-end UI where searches can be performed.
Using MySQL `like` is perfectly fine. Results should be shown on
the page without a full page reload. Use an AJAX request to add
the search results to the page. Results should be paginated with
5 articles per page. Pagination should also happen without a full
page refresh. Search against article body and title.
```

### Story 2a
```
Story Title: As a reader I would like to see search
suggestions as I start typing my search query so that
I can get results with less typing.

Description: Provide search suggestions when I type in the search
input field. Selecting a search suggestion should perform a search
using the suggested keywords. Search against article title.

```

### Story 2b
```
Story Title: As a reader I would like to see a list of the top 50
most commonly used words for all articles.

Description: Create a new page where I can see the list. List should
be sorted by most common to least common. Include article body and title.

```

### Story 3
```
Story Title: As a reader I would like my search results to be sorted by
relevancy according to my search query so that I see the most relevant
results at the top.

Description: Using a Ruby class and a simple word analyses algorithm
assign a relevancy score to each article based on the query provided.
Do not use a search engine library, you need to create your own algorithm.
Incorporate this relevancy score in the sort order of the search results.
Search against article body and title. An article that contains the same
word twice would have a relevancy score that is higher than an article
which only contains the searched word once.
```
