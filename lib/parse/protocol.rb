# encoding: utf-8
module Parse
  # A module which encapsulates the specifics of Parse's REST API.
  module Protocol
    # Basics
    # ----------------------------------------

    # The default hostname and path for communication with the Parse API.
    HOST            = 'https://api.bmob.cn'
    PATH            = '/1'

    # HTTP Headers
    # ----------------------------------------

    # The HTTP header used for passing your application ID to the
    # Parse API.
    HEADER_APP_ID   = 'X-Bmob-Application-Id'

    # The HTTP header used for passing your API key to the
    # Parse API.
    HEADER_API_KEY  = 'X-Bmob-REST-API-Key'

    # The HTTP header used for passing your API Master key to the
    # Parse API.
    HEADER_MASTER_KEY = 'X-Bmob-Master-Key'

    # The HTTP header used for passing your authenticated session
    HEADER_SESSION_TOKEN = 'X-Bmob-Session-Token'

    # JSON Keys
    # ----------------------------------------

    # The JSON key used to store the class name of an object
    # in a Pointer datatype.
    KEY_CLASS_NAME  = 'className'

    # The JSON key used to store the ID of Parse objects
    # in their JSON representation.
    KEY_OBJECT_ID   = 'objectId'

    # The JSON key used to store the creation timestamp of
    # Parse objects in their JSON representation.
    KEY_CREATED_AT  = 'createdAt'

    # The JSON key used to store the last modified timestamp
    # of Parse objects in their JSON representation.
    KEY_UPDATED_AT  = 'updatedAt'

    KEY_USER_SESSION_TOKEN = 'sessionToken'

    # The JSON key used in the top-level response object
    # to indicate that the response contains an array of objects.
    RESPONSE_KEY_RESULTS = 'results'
    KEY_RESULTS = RESPONSE_KEY_RESULTS

    # The JSON key used to identify an operator
    KEY_OP          = '__op'

    KEY_INCREMENT   = 'Increment'
    KEY_DELETE      = 'Delete'

    # array ops
    KEY_OBJECTS         = 'objects'
    KEY_ADD             = 'Add'
    KEY_ADD_RELATION    = 'AddRelation'
    KEY_REMOVE_RELATION = 'RemoveRelation'
    KEY_ADD_UNIQUE      = 'AddUnique'
    KEY_REMOVE          = 'Remove'

    DELETE_OP       = { KEY_OP => KEY_DELETE }

    # The JSON key used to identify the datatype of a special value.
    KEY_TYPE        = '__type'

    # The JSON key used to specify the numerical value in the
    # increment/decrement API call.
    KEY_AMOUNT      = 'amount'

    RESERVED_KEYS = [
      KEY_CLASS_NAME, KEY_CREATED_AT, KEY_OBJECT_ID,
      KEY_UPDATED_AT, KEY_USER_SESSION_TOKEN]

    # Other Constants
    # ----------------------------------------

    # Operation name for incrementing an objects field value remotely
    OP_INCREMENT    = 'Increment'

    # The data type name for special JSON objects representing a full object
    TYPE_OBJECT     = 'Object'

    # The data type name for special JSON objects representing a reference
    # to another Parse object.
    TYPE_POINTER    = 'Pointer'

    # The data type name for special JSON objects containing an array of
    # encoded bytes.
    TYPE_BYTES      = 'Bytes'

    # The data type name for special JSON objects representing a date/time.
    TYPE_DATE       = 'Date'

    # The data type name for special JSON objects representing a
    # location specified as a latitude/longitude pair.
    TYPE_GEOPOINT   = 'GeoPoint'

    # The data type name for special JSON objects representing
    # a file.
    TYPE_FILE       = 'File'

    # The data type name for special JSON objects representing
    # a Relation.
    TYPE_RELATION   = 'Relation'

    # The class name for User objects, when referenced by a Pointer.
    CLASS_USER      = '_User'

    CLASS_INSTALLATION = '_Installation'

    USER_LOGIN_URI = '/login'
    PASSWORD_RESET_URI = '/requestPasswordReset'

    CLOUD_FUNCTIONS_PATH = 'functions'

    BATCH_REQUEST_URI = 'batch'

    ERROR_INTERNAL = 1
    ERROR_TIMEOUT = 124
    ERROR_EXCEEDED_BURST_LIMIT = 155
    ERROR_OBJECT_NOT_FOUND_FOR_GET = 101

    # URI Helpers
    # ----------------------------------------

    def self.config_uri
      '/config'
    end

    # Construct a uri referencing a given Parse object
    # class or instance (of object_id is non-nil).
    def self.class_uri(class_name, object_id = nil)
      if object_id
        "/classes/#{class_name}/#{object_id}"
      else
        "/classes/#{class_name}"
      end
    end

    # Construct a uri referencing a given Parse installation
    # class or instance (of object_id is non-nil).
    def self.installation_uri(object_id = nil)
      if object_id
        "/installations/#{object_id}"
      else
        '/installations'
      end
    end

    # Construct a uri referencing a given Parse user
    # instance or the users category.
    def self.user_uri(user_id = nil)
      if user_id
        "/users/#{user_id}"
      else
        '/users'
      end
    end

    # Construct a uri referencing a file stored by the API.
    def self.file_uri(file_name)
      "/files/#{file_name}"
    end

    # Construct a uri to send a push notification via the API.
    def self.push_uri
      '/push'
    end

    def self.cloud_function_uri(function_name)
      "/#{CLOUD_FUNCTIONS_PATH}/#{function_name}"
    end

    def self.batch_request_uri
      "/#{BATCH_REQUEST_URI}"
    end
  end
end
