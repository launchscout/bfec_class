beforeEach ->
  jasmine.Ajax.useMock()

  # expect(actual).toRequest
  #   method: "GET"
  #   url: "/recipes/2"
  @addMatchers
    toRequest: (expectedRequest) ->
      actualRequest = @actual
      for name, value of expectedRequest
        @actual = actualRequest[name]
        @message = -> "Expected #{name} to be '#{value}' but got '#{@actual}'"
        return false if @actual != value
      return true
