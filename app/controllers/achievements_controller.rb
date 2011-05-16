class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.all
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(params[:achievement])
    if @achievement.save
      redirect_to @achievement, :notice => "Successfully created achievement."
    else
      render :action => 'new'
    end
  end

  def edit
    @achievement = Achievement.find(params[:id])
  end

  def update
    @achievement = Achievement.find(params[:id])
    if @achievement.update_attributes(params[:achievement])
      redirect_to @achievement, :notice  => "Successfully updated achievement."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy
    redirect_to achievements_url, :notice => "Successfully destroyed achievement."
  end
end
