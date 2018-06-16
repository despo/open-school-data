class SchoolsController < ApplicationController
  require 'spreadsheet_io'

  def show
    return render json: { error: 'invalid_urn'}.to_json unless valid_urn?

    school = SpreadsheetIo.new.find(urn_params)
    render json: { school: school }.to_json
    expires_in 1.days, public: true
  end

  def index
    keyword = params["keyword"] || ""
    return render json: { error: 'keyword must be at least 3 characters long'}.to_json unless keyword.length > 2

    @schools = SpreadsheetIo.new.search(keyword)
    expires_in 1.days, public: true
  end

  private
  def keyword_param
    params.permit(:keyword)
  end

  def urn_params
    params.permit(:id)[:id]
  end

  def valid_urn?
    !!Integer(urn_params) && urn_params.length.eql?(6)
  rescue ArgumentError, TypeError => e
    false
  end
end
