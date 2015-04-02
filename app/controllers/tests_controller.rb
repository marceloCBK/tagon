class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    #@tests = Test.all
    
   # @json = Face.get_client(:api_key => '0da8aecb5c5742d5828dd1f3dcb803e3', :api_secret => 'f5abf82e3c30437da4a1493570b2eed0').faces_detect(:urls => ['https://scontent-gru.xx.fbcdn.net/hphotos-xaf1/v/t1.0-9/295925_299091690117203_1901965243_n.jpg?oh=5e9b40f8a84da49056f1bade75a5c2f5&oe=55A4F3DD'])
    
    @json = JSON.parse('{"status":"success","photos":[{"url":"https://scontent-gru.xx.fbcdn.net/hphotos-xaf1/v/t1.0-9/295925_299091690117203_1901965243_n.jpg?oh=5e9b40f8a84da49056f1bade75a5c2f5&oe=55A4F3DD","pid":"F@01df0c701995bd986cba45fc7b36174d_6d24271ca738e","width":552,"height":635,"tags":[{"uids":[],"label":"","confirmed":false,"manual":false,"width":27.54,"height":23.94,"yaw":0,"roll":9,"pitch":0,"attributes":{"face":{"value":"true","confidence":57}},"points":"","similarities":"","tid":"TEMP_F@01df0c701995bd986cba45fc014400ee_6d24271ca738e_58.70_37.48_0_1","recognizable":true,"center":{"x":58.7,"y":37.48},"eye_left":{"x":67.21,"y":32.44,"confidence":55,"id":449},"eye_right":{"x":52.72,"y":30.24,"confidence":54,"id":450},"mouth_center":{"x":55.62,"y":45.2,"confidence":14,"id":615},"nose":{"x":58.7,"y":39.84,"confidence":51,"id":403}}]}],"usage":{"used":4,"remaining":96,"limit":100,"reset_time":1427513397,"reset_time_text":"Sat, 28 March 2015 03:29:57 +0000"},"operation_id":"98b451027d604fe7894e66e2c4184492"}')
    
    @eye_left = [
      'title' => "Left eye: X=#{@json['photos'][0]['tags'][0]['eye_left']['x']}, Y=#{@json['photos'][0]['tags'][0]['eye_left']['y']}, Confidence=#{@json['photos'][0]['tags'][0]['eye_left']['confidence']}"
    ]
    @eye_right = [
      'title' => "Left eye: X=#{@json['photos'][0]['tags'][0]['eye_right']['x']}, Y=#{@json['photos'][0]['tags'][0]['eye_right']['y']}, Confidence=#{@json['photos'][0]['tags'][0]['eye_right']['confidence']}"
    ]
    @mouth_center = [
      'title' => "Left eye: X=#{@json['photos'][0]['tags'][0]['mouth_center']['x']}, Y=#{@json['photos'][0]['tags'][0]['mouth_center']['y']}, Confidence=#{@json['photos'][0]['tags'][0]['mouth_center']['confidence']}"
    ]
    @nose = [
      'title' => "Left eye: X=#{@json['photos'][0]['tags'][0]['nose']['x']}, Y=#{@json['photos'][0]['tags'][0]['nose']['y']}, Confidence=#{@json['photos'][0]['tags'][0]['nose']['confidence']}"
    ]

    @style = "
    .eye_left {
        top: #{@json['photos'][0]['tags'][0]['eye_left']['y']}%; 
        left: #{@json['photos'][0]['tags'][0]['eye_left']['x']}%;
    }
    .eye_right {
        top: #{@json['photos'][0]['tags'][0]['eye_right']['y']}%; 
        left: #{@json['photos'][0]['tags'][0]['eye_right']['x']}%;
    }
    .mouth {
        top: #{@json['photos'][0]['tags'][0]['mouth_center']['y']}%; 
        left: #{@json['photos'][0]['tags'][0]['mouth_center']['x']}%;
    }
    .nose {
        top: #{@json['photos'][0]['tags'][0]['nose']['y']}%; 
        left: #{@json['photos'][0]['tags'][0]['nose']['x']}%;
    }
    .api_face {
        top: #{@json['photos'][0]['tags'][0]['center']['y']}%; 
        left: #{@json['photos'][0]['tags'][0]['center']['x']}%;  
        width: #{@json['photos'][0]['tags'][0]['width']}%;  
        height: #{@json['photos'][0]['tags'][0]['height']}%; 
        transform: translate(-50%, -50%);
    }
    "


  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :title, :content)
    end
end
