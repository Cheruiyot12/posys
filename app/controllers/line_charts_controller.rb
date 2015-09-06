class LineChartsController < ApplicationController
  before_action :set_line_chart, only: [:show, :edit, :update, :destroy]

  # GET /line_charts
  # GET /line_charts.json
  def index

      @line_chart_jans = LineChart.where(:month_name => "January")
      @line_chart_febs = LineChart.where(:month_name => "February")
      @line_chart_mars = LineChart.where(:month_name => "March")
      @line_chart_aprs = LineChart.where(:month_name => "April")
      @line_chart_mays = LineChart.where(:month_name => "May")
      @line_chart_juns = LineChart.where(:month_name => "June")
      @line_chart_juls = LineChart.where(:month_name => "July")
      @line_chart_augs = LineChart.where(:month_name => "August")
      @line_chart_seps = LineChart.where(:month_name => "September")
      @line_chart_octs = LineChart.where(:month_name => "October")
      @line_chart_novs = LineChart.where(:month_name => "November")
      @line_chart_decs = LineChart.where(:month_name => "December")


  end

  def my_linecharts
        @line_charts = LineChart.all
  end


  # GET /line_charts/1
  # GET /line_charts/1.json
  def show
  end

  # GET /line_charts/new
  def new
    @line_chart = LineChart.new
  end

  # GET /line_charts/1/edit
  def edit
  end

  # POST /line_charts
  # POST /line_charts.json
  def create
    @line_chart = LineChart.new(line_chart_params)

    respond_to do |format|
      if @line_chart.save
        format.html { redirect_to @line_chart, notice: 'Line chart was successfully created.' }
        format.json { render :show, status: :created, location: @line_chart }
      else
        format.html { render :new }
        format.json { render json: @line_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_charts/1
  # PATCH/PUT /line_charts/1.json
  def update
    respond_to do |format|
      if @line_chart.update(line_chart_params)
        format.html { redirect_to @line_chart, notice: 'Line chart was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_chart }
      else
        format.html { render :edit }
        format.json { render json: @line_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_charts/1
  # DELETE /line_charts/1.json
  def destroy
    @line_chart.destroy
    respond_to do |format|
      format.html { redirect_to line_charts_url, notice: 'Line chart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_chart
      @line_chart = LineChart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_chart_params
      params.require(:line_chart).permit(:month_name, :year, :total_income)
    end
end
