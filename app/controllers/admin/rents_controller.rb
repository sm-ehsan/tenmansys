class Admin::RentsController < Admin::ApplicationController
  before_action :set_rent, only: %i[ show edit update destroy ]

  # GET /rents or /rents.json
  def index
    @rents = Rent.all
  end

  # GET /rents/1 or /rents/1.json
  def show
  end

  # GET /rents/new
  def new
    @rent = Rent.new
  end

  # GET /rents/1/edit
  def edit
  end

  # POST /rents or /rents.json
  def create
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    respond_to do |format|
      if @rent.save
        format.html { redirect_to admin_rent_url(@rent), notice: "Rent was successfully created." }
        format.json { render :show, status: :created, location: @rent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rents/1 or /rents/1.json
  def update
    respond_to do |format|
      if @rent.update(rent_params)
        format.html { redirect_to admin_rent_url(@rent), notice: "Rent was successfully updated." }
        format.json { render :show, status: :ok, location: @rent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1 or /rents/1.json
  def destroy
    @rent.destroy

    respond_to do |format|
      format.html { redirect_to admin_rents_url, notice: "Rent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rent_params
      params.require(:rent).permit(:rentmonth, :duedate, :paymentdate, :rent, :gassbill, :lightbill, :servicecharge, :status, :paymentmode, :bankname, :accountnumber, :refnumber, :tenant_id)
    end
end
