define ['backbone'], (Backbone) ->
  class PaginatedCollection extends Backbone.Collection
    constructor: (args) ->
      if args?
        super(this.parse(args))
      else
        super

    initialize: ->
      _.bindAll @, 'fetch'
      @page = 1
      @perPage ||= 10

    fetch: (options = {}) ->
      success = options.success
      options.reset = true
      options.success = (resp) =>
        success(@, resp) if success?

      Backbone.Collection::fetch.call @, options

    setPage: (num, options = {}) ->
      @page = num
      @fetch options


    parse: (resp) ->
      @page    = resp.current_page
      @perPage = resp.per_page
      @total   = resp.total_items
      resp.items

    url: ->
      @baseUrl + '?' + $.param(
        page: @page
      )

    pageInfo: ->
      info =
        total: @total
        page: @page
        perPage: @perPage
        pages: Math.ceil(@total / @perPage)
        prev: false
        next: false

      max = Math.min(@total, @page * @perPage)
      max = @total if @total is info.pages * @perPage
      info.range = [(@page - 1) * @perPage + 1, max]
      info.prev = @page - 1  if @page > 1
      info.next = @page + 1  if @page < info.pages
      info

    toJSON: ->
      data = {}
      data['items'] = super
      data['pageInfo'] = this.pageInfo()
      data

    nextPage: (options = {}) ->
      return false unless @pageInfo().next
      @page = @page + 1
      @fetch options

    previousPage: (options = {}) ->
      return false unless @pageInfo().prev
      @page = @page - 1
      @fetch options
