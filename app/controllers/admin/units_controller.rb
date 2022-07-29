# frozen_string_literal: true

module Admin
  class UnitsController < Admin::ApplicationController
    before_action :set_unit, only: %i[show edit update destroy]

    # GET /units or /units.json
    def index
      @pagy, @units = pagy(Unit.all.order('Created_at ASC'), items: 10)
    end

    # GET /units/1 or /units/1.json
    def show; end

    # GET /units/new
    def new
      @unit = Unit.new
    end

    # GET /units/1/edit
    def edit; end

    # POST /units or /units.json
    def create
      @unit = Unit.new(unit_params)
      @unit.user = current_user

      respond_to do |format|
        if @unit.save
          format.html do
            flash[:success] = 'Unit was successfully created.'
            redirect_to admin_unit_url(@unit)
          end
          format.json { render :show, status: :created, location: @unit }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @unit.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /units/1 or /units/1.json
    def update
      respond_to do |format|
        if @unit.update(unit_params)
          format.html do
            flash[:success] = 'Unit was successfully updated.'
            redirect_to admin_unit_url(@unit)
          end
          format.json { render :show, status: :ok, location: @unit }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @unit.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /units/1 or /units/1.json
    def destroy
      @unit.destroy

      respond_to do |format|
        format.html do
          flash[:danger] = 'Unit was successfully destroyed.'
          redirect_to admin_units_url
        end
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_params
      params.require(:unit).permit(:name, :bedroom, :bathroom, :drawingroom, :status, :dining, :kitchen, :elecmetno,
                                   :property_id)
    end
  end
end
