class DocProcessorWorker
  include Sidekiq::Worker

  def process(pdf_document)
    # research the best way to process an image/pdf with a worker
  end
end