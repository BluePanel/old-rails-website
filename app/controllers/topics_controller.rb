# Copyright © 2013 BluePanel.org
#
# This file is part of BluePanel-Website.
# 
#     BluePanel-Website is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     BluePanel-Website is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with BluePanel-Website.  If not, see <http://www.gnu.org/licenses/>.
# 
# Diese Datei ist Teil von BluePanel-Website.
# 
#     BluePanel-Website ist Freie Software: Sie können es unter den Bedingungen
#     der GNU General Public License, wie von der Free Software Foundation,
#     Version 3 der Lizenz oder (nach Ihrer Option) jeder späteren
#     veröffentlichten Version, weiterverbreiten und/oder modifizieren.
# 
#     BluePanel-Website wird in der Hoffnung, dass es nützlich sein wird, aber
#     OHNE JEDE GEWÄHELEISTUNG, bereitgestellt; sogar ohne die implizite
#     Gewährleistung der MARKTFÄHIGKEIT oder EIGNUNG FÜR EINEN BESTIMMTEN ZWECK.
#     Siehe die GNU General Public License für weitere Details.
# 
#     Sie sollten eine Kopie der GNU General Public License zusammen mit diesem
#     Programm erhalten haben. Wenn nicht, siehe <http://www.gnu.org/licenses/>. 

class TopicsController < ApplicationController
  load_and_authorize_resource
  
  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(:name => params[:topic][:name],
                       :last_poster_id => current_user.id,
                       :last_post_at => Time.now,
                       :forum_id => params[:topic][:forum_id],
                       :user_id => current_user.id)

    respond_to do |format|
      if @topic.save
        @post = Post.new(:content => params[:post][:content],
                         :topic_id => @topic.id,
                         :user_id => current_user.id)
        if @post.save
          format.html { redirect_to "/forums/#{@topic.forum_id}", notice: 'Topic was successfully created.' }
          format.json { render json: @topic, status: :created, location: @topic }
        else
          format.html { render action: "new" }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        @post = @topic.posts.first
        if @post.update_attributes(params[:post])
          format.html { redirect_to "/forums/#{@topic.forum_id}", notice: 'Topic was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to "/forums/#{@topic.forum_id}" }
      format.json { head :no_content }
    end
  end
end
