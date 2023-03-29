class FavoriteMailer < ApplicationMailer
  # default from: 'notifications@example.com'

  def new_favorite(movies, user)
    @greeting = "Hi, #{user.nickname}"

    attachments["favorite_movies.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(partial: 'favorites/table_for_pdf',
        locals: {favorites: movies}, layout: 'pdf', pdf: 'favorite_movies')
      )

    mail to: user.email, subject: 'Favorite Movies'
  end
end
