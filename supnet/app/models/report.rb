class Report < ApplicationRecord
  # For stubbing report creation with pdfkit
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :organization
  belongs_to :portfolio
  has_one_attached :report_file

  API_ENDPOINT = "http://enpoint"
  API_KEY = "1234abcd"

  validates_presence_of :name

  # def run_report
  #   logger.debug "-----------> RUNNING REPORT"

  #   # self.portfolio.status = "Running"
  #   # self.portfolio.save

  #   logger.debug "-----------> CHANGED PORTFOLIO STATUS"
  #   html = "<html><head><title>yo</title></head><body>Generated HTML: #{Time.now.strftime("%Y-%m-%d %H:%M")}</body></html>"

  #   logger.debug "-----------> CREATING PDF"
  #   kit = PDFKit.new(html, :page_size => 'Letter')
  #   pdf = kit.to_pdf
  #   # file = kit.to_file('/path/to/save/pdf')

  #   logger.debug "-----------> ATTACHING PDF"
  #   logger.debug "-----------> self.id: #{self.id}"
  #   logger.debug "-----------"
  #   logger.debug "-----------> pdf: #{pdf.inspect}"
  #   logger.debug "-----------"
  #   logger.debug "-----------> filename: #{self.id}.pdf"
  #   self.report_file.attach(
  #     io: StringIO.new(pdf),
  #     filename: "#{self.id}.pdf",
  #     content_type: 'application/pdf'
  #   )
  #   logger.debug "-----------> SAVING REPORT"
  #   # self.save

  #   # portfolio.uploaded_file.blob
  #   # Hit report serviced
  #   # headers = {
  #   #   "Content-Type": "application/json",
  #   #   "X-API-Key": Report::API_KEY
  #   # }

  #   # HTTParty.post(  Report::API_ENDPOINT,
  #   #                 body: { attachments: [
  #   #                 File.read( self.portfolio.uploaded_file.blob.something )] },
  #   #                 headers: headers)

  #   # get response, save it as a report, associate report with portfolio

  #   # self.portfolio.status = "Active"
  #   # self.portfolio.save
  # end

end
