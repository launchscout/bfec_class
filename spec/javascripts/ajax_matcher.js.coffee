beforeEach ->
  jasmine.Ajax.useMock()
  @addMatchers
    toRequest: (expectedRequest) ->
      actualRequest = @actual
      for name, value of expectedRequest
        @actual = actualRequest[name]
        @message = -> "Expected #{name} to be '#{value}' but got '#{@actual}'"
        return false if @actual != value
      return true
