# frozen_string_literal: true

module Lcms
  module Engine
    class MaterialForm
      include Virtus.model
      include ActiveModel::Model
      include Lcms::Engine::GoogleCredentials

      attribute :link, String
      attribute :source_type, String
      validates :link, presence: true

      attr_accessor :material

      def initialize(attributes = {}, opts = {})
        super(attributes)
        @options = opts
      end

      def save
        return false unless valid?

        params = {
          import_retry: options[:import_retry],
          source_type: source_type.presence
        }.compact
        service = MaterialBuildService.new google_credentials, params
        @material = service.build link

        material.update preview_links: {}
        after_reimport_hook
      rescue StandardError => e
        Rails.logger.error e.message + "\n " + e.backtrace.join("\n ")
        errors.add(:link, e.message)
        false
      end

      private

      attr_reader :options

      def after_reimport_hook; end
    end
  end
end
