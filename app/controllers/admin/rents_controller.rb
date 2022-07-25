class Admin::RentsController < Admin::ApplicationController
  before_action :set_rent, only: %i[ show edit update destroy ]

  # GET /rents or /rents.json
  def index
    @pagy, @rents = pagy(Rent.all.order("Created_at DESC"), items: 10)
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
        format.html{
        flash[:success] = "Rent created successfully"
        redirect_to admin_rent_path(@rent)
        }
      else
        format.html { render(:new, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /rents/1 or /rents/1.json
  def update
    respond_to do |format|
      if @rent.update(rent_params)
        format.html { 
          flash[:success] = "Rent was successfully updated." 
          redirect_to admin_rent_url(@rent)
        }
        format.json { render :show, status: :ok, location: @rent }
      else
        format.html { 
          render :edit, 
          status: :unprocessable_entity 
        }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1 or /rents/1.json
  def destroy
    @rent.destroy

    respond_to do |format|
      format.html { 
        flash[:danger] = "Rent was successfully destroyed." 
        redirect_to admin_rents_url 
      }
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
      params.require(:rent).permit(:rentmonth, :duedate, :paymentdate, :rent, :gassbill, :lightbill, :waterbill, :servicecharge, :status, :paymentmode, :bankname, :accountnumber, :refnumber, :total, :othercharges, :note, :tenant_id, :property_id)
    end
end
