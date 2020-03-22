class CreatorStepsController < ApplicationController
  include Wicked::Wizard
  steps :category, :restriction

  def show
    render_wizard
  end
end
