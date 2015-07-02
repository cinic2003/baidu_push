module BaiduPush
  class Client

    RESOURCE = {push_all: 'push/all', 
                push_single: 'push/single_device',
                push_batch: 'push/batch_device',
                push_tags: 'push/tags'}

    REQUEST_METHOD = :post
    DEFAULT_OPTIONS = {
      use_ssl: false,
      api_version: '3.0'
    }
    API_HOST = "api.tuisong.baidu.com/rest/#{DEFAULT_OPTIONS[:api_version]}"

    attr_reader :api_key, :secret_key, :resource, :api_uri, :request_method, :options 
    attr_accessor :resource

    def initialize(api_key: '', secret_key: '', options: {})
      @api_key, @secret_key = api_key.strip, secret_key.strip
      @options = DEFAULT_OPTIONS.merge options

      @request = Request.new(self)
    end

    ###################################################
    # Basic API
    #

    def push_all msg: '', msg_type: 1
      set_resource RESOURCE[:push_all]
      params = {msg_type: msg_type, msg: msg.to_json} #, timestamp: Time.now.to_i, apikey: @api_key}

      @api_uri = set_api_uri
      @request.fetch params
    end

    def push_single msg: '', channel_id: '', msg_type: 1
      set_resource RESOURCE[:push_single]
      params = {msg_type: msg_type, msg: msg.to_json, channel_id: channel_id} #, timestamp: Time.now.to_i}
      @api_uri = set_api_uri
      @request.fetch params
    end

    def push_batch msg: '', channel_ids: [], msg_type: 1
      set_resource RESOURCE[:push_batch]
      params = {msg_type: msg_type, msg: msg.to_json, channel_ids: channel_ids} #, timestamp: Time.now.to_i}
      @api_uri = set_api_uri
      @request.fetch params
    end

    def push_msg(push_type, messages, msg_keys, params = {})
      set_to_default_resource
      params.merge!({
        push_type: push_type,
        messages: messages.to_json,
        msg_keys: msg_keys
      })
      @request.fetch(:push_msg, params)
    end

    def init_app_ioscert(name, description, release_cert, dev_cert, params = {})
      params.merge!({
        name: name,
        description: description,
        release_cert: release_cert,
        dev_cert: dev_cert
      })
      @request.fetch(:init_app_ioscert, params)
    end

    def update_app_ioscert(params = {})
      @request.fetch(:update_app_ioscert, params)
    end

    def delete_app_ioscert(params = {})
      @request.fetch(:delete_app_ioscert, params)
    end

    def query_app_ioscert(params = {})
      @request.fetch(:query_app_ioscert, params)
    end
    #
    # Basic API
    ###################################################

    ###################################################
    # Advanced API
    #
    def verify_bind(user_id, params = {})
      params.merge!({
        user_id: user_id
      })
      @request.fetch(:verify_bind, params)
    end

    def fetch_msg(user_id, params = {})
      params.merge!({
        user_id: user_id
      })
      @request.fetch(:fetch_msg, params)
    end

    def fetch_msgcount(user_id, params = {})
      params.merge!({
        user_id: user_id
      })
      @request.fetch(:fetch_msgcount, params)
    end

    def delete_msg(user_id, msg_ids, params = {})
      params.merge!({
        user_id: user_id,
        msg_ids: msg_ids.to_json
      })
      @request.fetch(:delete_msg, params)
    end

    def set_tag(tag, params = {})
      set_to_default_resource
      params.merge!({
        tag: tag
      })
      @request.fetch(:set_tag, params)
    end

    def fetch_tag(params = {})
      set_to_default_resource
      @request.fetch(:fetch_tag, params)
    end

    def delete_tag(tag, params = {})
      set_to_default_resource
      params.merge!({
        tag: tag
      })
      @request.fetch(:delete_tag, params)
    end

    def query_user_tags(user_id, params = {})
      set_to_default_resource
      params.merge!({
        user_id: user_id
      })
      @request.fetch(:query_user_tags, params)
    end

    def query_device_type(params = {})
      @request.fetch(:query_device_type, params)
    end
    #
    # Advanced API
    ###################################################

    private
    def set_api_uri
      @request_method = REQUEST_METHOD
      scheme = @options[:use_ssl] ? 'https' : 'http'
      @api_uri = "#{scheme}://#{API_HOST}/#{@resource}"
    end

    def set_resource resource
      @resource = resource
    end
  end
end
