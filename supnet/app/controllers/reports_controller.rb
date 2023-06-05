class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: %i[ show edit update destroy ]

  # GET /reports or /reports.json
  def index
    @title = "Reports"
    @reports = Report.where(user: current_user)
  end

  # GET /reports/1 or /reports/1.json
  def show
    @title = "Report"
  end

  # GET /reports/new
  def new
    @title = "New Report"
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
    @title = "Edit Report"
  end

  # POST /reports or /reports.json
  # TODO: irl this will hit a service. hacking this in for dev purposes
  def create
    @report = Report.new(report_params)
    @report.name = "Report #{Time.now.to_i}"
    @report.user = current_user
    @report.organization = current_user.organization
    @report.portfolio_id = params[:portfolio_id]

    respond_to do |format|
      if @report.save

        @report.portfolio.status = "Running"
        @report.portfolio.save
        html = "<html><head><title>yo</title></head><body>This PDF was generated on
          <h1>
          #{Time.now.strftime("%B %e, %Y at %l:%M%P UTC")}
          </h1>
        </body></html>"

        kit = PDFKit.new(html, :page_size => 'Letter')
        pdf = kit.to_pdf
        io = StringIO.new(pdf)

        @report.report_file.attach(
          io: io,
          filename: "#{Time.now.to_i}.pdf",
          content_type: 'application/pdf'
        )
        @report.portfolio.status = "Active"
        @report.portfolio.save

        format.html { redirect_to report_url(@report), notice: "Report was successfully created." }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_url(@report), notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(
        :name, :portfolio_id
      )
    end

end
