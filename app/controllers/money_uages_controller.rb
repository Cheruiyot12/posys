class MoneyUagesController < ApplicationController
  before_action :set_money_uage, only: [:show, :edit, :update, :destroy]

  # GET /money_uages
  # GET /money_uages.json
  def index
    @money_uages = MoneyUage.all
  end

  # GET /money_uages/1
  # GET /money_uages/1.json
  def show
  end

  # GET /money_uages/new
  def new
    @money_uage = MoneyUage.new
  end

  # GET /money_uages/1/edit
  def edit
  end

  # POST /money_uages
  # POST /money_uages.json
  def create
    @money_uage = MoneyUage.new(money_uage_params)

    respond_to do |format|
      if @money_uage.save
        format.html { redirect_to money_uages_path, notice: 'Money uage was successfully created.' }
        format.json { render :show, status: :created, location: @money_uage }
      else
        format.html { render :new }
        format.json { render json: @money_uage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /money_uages/1
  # PATCH/PUT /money_uages/1.json
  def update
    respond_to do |format|
      if @money_uage.update(money_uage_params)
        format.html { redirect_to money_uages_path, notice: 'Money uage was successfully updated.' }
        format.json { render :show, status: :ok, location: @money_uage }
      else
        format.html { render :edit }
        format.json { render json: @money_uage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money_uages/1
  # DELETE /money_uages/1.json
  def destroy
    @money_uage.destroy
    respond_to do |format|
      format.html { redirect_to money_uages_url, notice: 'Money uage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money_uage
      @money_uage = MoneyUage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def money_uage_params
      params.require(:money_uage).permit(:transaction_date, :income, :outcome, :money_in_shop, :remark)
    end
end
