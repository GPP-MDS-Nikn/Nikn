class StaticPagesController < ApplicationController
 	# Bypass authorization check for pages controller.
	skip_authorization_check

  def home
  end

  def about
  end

  def contact
  end

  def opendata
  end
end
