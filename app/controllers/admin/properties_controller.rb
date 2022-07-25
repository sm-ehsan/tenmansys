class Admin::PropertiesController < Admin::ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all.order("Created_at Desc")
  end

  # GET /properties/1 or /properties/1.json
  def show
    @property = Property.find(params[:id])
    @pagy, @rents = pagy(@property.rents.order("created_at desc"), items: 10)
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.user = current_user
    respond_to do |format|
      if @property.save
        format.html { 
          flash[:success] = "Property was successfully created." 
          redirect_to admin_property_url(@property) 
        }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { 
          flash[:success] = "Property was successfully updated." 
          redirect_to admin_property_url(@property)
        }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { 
        flash[:danger] = "Property was successfully destroyed." 
        redirect_to admin_properties_url 
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :landlord, :description, :addrline1, :addrline2, :zipcode, :city, :country, :contactno)
    end
end