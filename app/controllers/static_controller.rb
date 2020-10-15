class StaticController < ApplicationController
  def home
  end

  def about
  end

  def resume
  end

  def download
    send_file(
      "#{Rails.root}/public/resume.pdf",
      filename: "Wills Blake's Resume",
      disposition: "inline",
      type: "application/pdf"
    )

  end
end