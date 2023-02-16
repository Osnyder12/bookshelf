# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module Bookshelf
  class Action < Hanami::Action
    # .one! method (in actions/books/show.rb) raises ROM::TupleCountMismatchError if no record is found
    # call the this will catch this exception and call the handle_not_found method
    config.handle_exception ROM::TupleCountMismatchError => :handle_not_found

    private

    def handle_not_found(_request, response, _exception)
      response.status = 404
      response.format = :json
      response.body = {error: "not_found"}.to_json
    end
  end
end
