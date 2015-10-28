class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :upvote, :downvote]

  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = Wish.all.sort_by(&:score).reverse
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
  end

  # GET /wishes/new
  def new
    @wish = Wish.new
    @wish.build_location
    @wish.skills.new
  end

  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes
  # POST /wishes.json
  def create
    @wish = current_user.wishes.new(wish_params)

    respond_to do |format|
      if @wish.save

        if params[:photos]
          params[:photos].each do |photo|
            @wish.images.create(photo: photo)
          end
        end

        format.html { redirect_to @wish, notice: 'Wish was successfully created.' }
        format.json { render :show, status: :created, location: @wish }
      else
        format.html { render :new }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishes/1
  # PATCH/PUT /wishes/1.json
  def update
    respond_to do |format|
      if @wish.update(wish_params)
        format.html { redirect_to @wish, notice: 'Wish was successfully updated.' }
        format.json { render :show, status: :ok, location: @wish }
      else
        format.html { render :edit }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish.destroy
    respond_to do |format|
      format.html { redirect_to wishes_url, notice: 'Wish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @wish = Wish.find(params[:id])
    @wish.upvote_by current_user
    redirect_to wishes_path
  end

  def downvote
    @wish = Wish.find(params[:id])
    @wish.downvote_by current_user
    redirect_to wishes_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_wish
    @wish = Wish.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def wish_params
    params.require(:wish).permit(:title, :description, location_attributes: [:address], skills_attributes: [:name])
  end
end
