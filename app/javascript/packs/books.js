const queryString = require('query-string');

document.addEventListener('turbolinks:load', () => {
    $('.ui.search')
        .search({
            apiSettings: {
                url: "/books/search?q={query}"
            },
            fields: {
                results: 'items',
                title: 'title',
                url: 'url',
                description: 'authors'
            },
            minCharacters: 3
        })
    ;
})