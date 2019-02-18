# frozen_string_literal: true

class StaysController < ApplicationController
  def show
    @stay = Stay.find(params[:id])
  end
end
