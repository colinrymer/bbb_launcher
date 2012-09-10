class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json
  def index
    Session.delete_all
    
    @bbb = BBBApi.new :server => "test-install.blindsidenetworks.com/bigbluebutton/api", :salt => "8cd8ef52e8e101574e400365b55e11a6"
    @bbb.getMeetings do |doc|		
      doc.search('//meeting').each do |node|
			  @name = node.at_xpath('meetingName').content
			  @moderatorPW = node.at_xpath('meetingName').content
			  @moderatorPW = doc.at_xpath('//moderatorPW').content
        @attendeePW = doc.at_xpath('//attendeePW').content

			  @viewers = "fred"
			  @moderators = "Susan"
			  @recorded = false

			  @session = Session.new(
          :name => @name,
          :moderators => @moderators,
          :viewers => @viewers,
        )

          @session.save!
			end
    end

    @sessions = Session.all
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    @session = Session.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(params[:session])

    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
        format.json { render json: @session, status: :created, location: @session }
      else
        format.html { render action: "new" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session = Session.find(params[:id])
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end
end
