class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show ]

  # # GET /portfolios or /portfolios.json
  def index
    @title = "Users"

    @users = Users.all
  end

  # GET /portfolios/1 or /portfolios/1.json
  def show
    @title = "Portfolio"
    respond_to do |format|
      format.html {
        authenticate_user!
        render :show
      }
      format.json do
        # render "portfolios/pact"
      end
    end
  end

  # # GET /portfolios/new
  # def new
  #   authenticate_user!

  #   @title = "New Portfolio"
  #   @portfolio = Portfolio.new
  # end

  # # GET /portfolios/1/edit
  # def edit
  #   @title = "Edit Portfolio"
  # end

  # # POST /portfolios or /portfolios.json
  # def create
  #   respond_to do |format|
  #     format.html {
  #       @portfolio = Portfolio.new(portfolio_params)
  #       @portfolio.user = current_user
  #     }

  #     format.json {
  #       # # Validate the API key, return if you can't
  #       # if request.headers.include?("X-API-Key")
  #       #   # TODO
  #       # else
  #       #   logger.debug "Missing API key for POSTED portfolio info"
  #       #   return 401
  #       # end
  #     }
  #   end

  #   respond_to do |format|

  #     if @portfolio.save

  #       format.html {
  #         redirect_to portfolio_url(@portfolio), notice: "Portfolio successfully created."
  #       }

  #       format.json {
  #         # render :show, status: :created
  #       }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @portfolio.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /portfolios/1 or /portfolios/1.json
  # def update
  #   respond_to do |format|
  #     if @portfolio.update(portfolio_params)
  #       format.html {
  #         redirect_to portfolio_url(@portfolio), notice: "Portfolio successfully updated."
  #       }
  #       format.json { render :show, status: :ok, location: @portfolio }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @portfolio.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /portfolios/1 or /portfolios/1.json
  # def destroy
  #   @portfolio.destroy

  #   respond_to do |format|
  #     format.html { redirect_to portfolios_url, notice: "Portfolio successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  #   # Only allow a list of trusted parameters through.
  #   def portfolio_params
  #     params.require(:portfolio).permit(
  #       :name, :description, :status, :uploaded_file
  #     )
  #   end
end
