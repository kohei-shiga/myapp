class Admin::ArticlesController < ApplicationController
  before_action :admin_user
  
  def spams
    spams = ReportSpam.all
    spam_articles = ReportSpam.spam_articles(spams)
    @spam_articles = Kaminari.paginate_array(spam_articles).page(params[:page])
  end
  
  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to spams_admin_articles_url
  end
end