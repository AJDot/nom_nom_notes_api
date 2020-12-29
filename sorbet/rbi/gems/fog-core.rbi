# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/fog-core/all/fog-core.rbi
#
# fog-core-2.2.0

module Fog
  def self.credential; end
  def self.credential=(new_credential); end
  def self.credentials; end
  def self.credentials=(arg0); end
  def self.credentials_path; end
  def self.credentials_path=(new_credentials_path); end
  def self.interval; end
  def self.interval=(interval); end
  def self.max_interval; end
  def self.max_interval=(interval); end
  def self.mock!; end
  def self.mock?; end
  def self.mocking; end
  def self.mocking?; end
  def self.providers; end
  def self.providers=(arg0); end
  def self.services; end
  def self.symbolize_credential?(key); end
  def self.symbolize_credentials(hash); end
  def self.timeout; end
  def self.timeout=(timeout); end
  def self.unmock!; end
  def self.wait_for(timeout = nil, interval = nil, &_block); end
end
module Fog::Core
end
module Fog::ServicesMixin
  def [](provider); end
  def check_provider_alias(provider); end
  def const_get_args(*args); end
  def new(attributes); end
  def providers; end
  def require_service_provider_library(service, provider); end
  def service_name; end
  def service_provider_constant(service_name, provider_name); end
end
module Fog::Attributes
end
module Fog::Attributes::ClassMethods
  def _load(marshalled); end
  def aliases; end
  def associations; end
  def attribute(name, options = nil); end
  def attributes; end
  def default_values; end
  def has_many(name, collection_name, options = nil); end
  def has_many_identities(name, collection_name, options = nil); end
  def has_one(name, collection_name, options = nil); end
  def has_one_identity(name, collection_name, options = nil); end
  def identity(name, options = nil); end
  def ignore_attributes(*args); end
  def ignored_attributes; end
  def masks; end
end
module Fog::Attributes::InstanceMethods
  def _dump(_level); end
  def all_associations; end
  def all_associations_and_attributes; end
  def all_attributes; end
  def associations; end
  def attributes; end
  def dup; end
  def dup_attributes!; end
  def identity; end
  def identity=(new_identity); end
  def identity_name; end
  def masks; end
  def merge_attributes(new_attributes = nil); end
  def missing_attributes(args); end
  def new_record?; end
  def persisted?; end
  def remap_attributes(attributes, mapping); end
  def requires(*args); end
  def requires_one(*args); end
end
class Fog::Attributes::Default
  def aliases; end
  def as; end
  def create_aliases; end
  def create_getter; end
  def create_mask; end
  def create_setter; end
  def default; end
  def initialize(model, name, options); end
  def model; end
  def name; end
  def set_defaults; end
  def squash; end
end
class Fog::Attributes::Array < Fog::Attributes::Default
  def create_getter; end
  def create_setter; end
end
class Fog::Attributes::Boolean < Fog::Attributes::Default
  def create_setter; end
end
class Fog::Attributes::Float < Fog::Attributes::Default
  def create_setter; end
end
class Fog::Attributes::Integer < Fog::Attributes::Default
  def create_setter; end
end
class Fog::Attributes::String < Fog::Attributes::Default
  def create_setter; end
end
class Fog::Attributes::Time < Fog::Attributes::Default
  def create_setter; end
end
class Fog::Attributes::Timestamp < Fog::Attributes::Default
  def create_setter; end
end
module Fog::Associations
end
class Fog::Associations::Default
  def aliases; end
  def as; end
  def association_class; end
  def create_aliases; end
  def create_mask; end
  def initialize(model, name, collection_name, options); end
  def model; end
  def name; end
end
class Fog::Associations::ManyIdentities < Fog::Associations::Default
  def create_getter; end
  def create_setter; end
end
class Fog::Associations::ManyModels < Fog::Associations::Default
  def create_getter; end
  def create_setter; end
end
class Fog::Associations::OneModel < Fog::Associations::Default
  def create_getter; end
  def create_setter; end
end
class Fog::Associations::OneIdentity < Fog::Associations::Default
  def create_getter; end
  def create_setter; end
end
module Fog::Core::DeprecatedConnectionAccessors
  def connection; end
  def connection=(service); end
  def prepare_service_value(attributes); end
end
class Fog::Collection < Array
  def &(*args); end
  def *(*args); end
  def +(*args); end
  def -(*args); end
  def <<(*args); end
  def <=>(*args); end
  def ==(*args); end
  def [](*args); end
  def []=(*args); end
  def all?(*args); end
  def any?(*args); end
  def append(*args); end
  def as_json(*args); end
  def assoc(*args); end
  def at(*args); end
  def blank?(*args); end
  def bsearch(*args); end
  def bsearch_index(*args); end
  def clear; end
  def collect!(*args); end
  def collect(*args); end
  def combination(*args); end
  def compact!(*args); end
  def compact(*args); end
  def concat(*args); end
  def count(*args); end
  def create(attributes = nil); end
  def cycle(*args); end
  def deep_dup(*args); end
  def delete(*args); end
  def delete_at(*args); end
  def delete_if(*args); end
  def destroy(identity); end
  def difference(*args); end
  def dig(*args); end
  def drop(*args); end
  def drop_while(*args); end
  def each(*args); end
  def each_index(*args); end
  def empty?(*args); end
  def eql?(*args); end
  def excluding(*args); end
  def extract!(*args); end
  def extract_options!(*args); end
  def fetch(*args); end
  def fifth(*args); end
  def fill(*args); end
  def filter!(*args); end
  def filter(*args); end
  def find_index(*args); end
  def first(*args); end
  def flatten!(*args); end
  def flatten(*args); end
  def forty_two(*args); end
  def fourth(*args); end
  def from(*args); end
  def hash(*args); end
  def include?(*args); end
  def including(*args); end
  def index(*args); end
  def initialize(attributes = nil); end
  def insert(*args); end
  def inspect; end
  def join(*args); end
  def keep_if(*args); end
  def last(*args); end
  def lazy_load; end
  def length(*args); end
  def load(objects); end
  def map!(*args); end
  def map(*args); end
  def max(*args); end
  def min(*args); end
  def model; end
  def new(attributes = nil); end
  def none?(*args); end
  def one?(*args); end
  def pack(*args); end
  def permutation(*args); end
  def pop(*args); end
  def prepend(*args); end
  def product(*args); end
  def push(*args); end
  def rassoc(*args); end
  def reject!(*args); end
  def reject(*args); end
  def reload; end
  def repeated_combination(*args); end
  def repeated_permutation(*args); end
  def replace(*args); end
  def reverse!(*args); end
  def reverse(*args); end
  def reverse_each(*args); end
  def rindex(*args); end
  def rotate!(*args); end
  def rotate(*args); end
  def sample(*args); end
  def second(*args); end
  def second_to_last(*args); end
  def select!(*args); end
  def select(*args); end
  def self.model(new_model = nil); end
  def service; end
  def shelljoin(*args); end
  def shift(*args); end
  def shuffle!(*args); end
  def shuffle(*args); end
  def size(*args); end
  def slice!(*args); end
  def slice(*args); end
  def sort!(*args); end
  def sort(*args); end
  def sort_by!(*args); end
  def sum(*args); end
  def table(attributes = nil); end
  def take(*args); end
  def take_while(*args); end
  def third(*args); end
  def third_to_last(*args); end
  def to(*args); end
  def to_a(*args); end
  def to_ary(*args); end
  def to_default_s(*args); end
  def to_formatted_s(*args); end
  def to_h(*args); end
  def to_json(_options = nil); end
  def to_param(*args); end
  def to_query(*args); end
  def to_s(*args); end
  def to_sentence(*args); end
  def to_xml(*args); end
  def transpose(*args); end
  def union(*args); end
  def uniq!(*args); end
  def uniq(*args); end
  def unshift(*args); end
  def values_at(*args); end
  def without(*args); end
  def zip(*args); end
  def |(*args); end
  extend Fog::Attributes::ClassMethods
  include Fog::Attributes::InstanceMethods
  include Fog::Core::DeprecatedConnectionAccessors
end
class Fog::PagedCollection < Fog::Collection
  def each(collection_filters = nil); end
end
class Fog::Association < Fog::Collection
  def initialize(associations = nil); end
  def load(associations); end
end
class Fog::Core::Connection
  def handle_path_prefix_for(params); end
  def initialize(url, persistent = nil, params = nil); end
  def original_request(params, &block); end
  def request(params, &block); end
  def reset; end
  def self.add_user_agent(str); end
  def self.user_agents; end
  def user_agent; end
end
module Fog::Deprecation
  def deprecate(older, newer); end
  def self_deprecate(older, newer); end
end
class Fog::CurrentMachine
  def self.ip_address; end
  def self.ip_address=(ip_address); end
end
module Fog::Errors
  def self.missing_credentials; end
end
class Fog::Errors::Error < StandardError
  def self.slurp(error, message = nil); end
  def verbose; end
  def verbose=(arg0); end
end
class Fog::Errors::MockNotImplemented < Fog::Errors::Error
end
class Fog::Errors::NotFound < Fog::Errors::Error
end
class Fog::Errors::LoadError < Fog::Errors::Error
end
class Fog::Errors::TimeoutError < Fog::Errors::Error
end
class Fog::Errors::NotImplemented < Fog::Errors::Error
end
class Fog::HMAC
  def initialize(type, key); end
  def setup_sha1; end
  def setup_sha256; end
  def sign(data); end
end
class Fog::Logger
  def self.[](channel); end
  def self.[]=(channel, value); end
  def self.debug(message); end
  def self.deprecation(message); end
  def self.warning(message); end
  def self.write(key, value); end
end
class Fog::Cache
  def dump; end
  def dump_to; end
  def initialize(model); end
  def model; end
  def self.clean!; end
  def self.const_get_compat(strklass); end
  def self.create_namespace(model_klass, service); end
  def self.expire_cache!(model_klass, service); end
  def self.load(model_klass, service); end
  def self.load_cache(path); end
  def self.metadata; end
  def self.namespace(model_klass, service); end
  def self.namespace_prefix; end
  def self.namespace_prefix=(name); end
  def self.safe_path(klass); end
  def self.uniq_w_block(arr); end
  def self.valid_for_load?(path); end
  def self.write_metadata(h); end
end
class Fog::Cache::CacheNotFound < StandardError
end
class Fog::Cache::CacheDir < StandardError
end
class Fog::Model
  def ==(o); end
  def cache; end
  def collection; end
  def collection=(arg0); end
  def initialize(new_attributes = nil); end
  def inspect; end
  def reload; end
  def service; end
  def symbolize_keys(hash); end
  def to_json(_options = nil); end
  def wait_for(timeout = nil, interval = nil, &block); end
  extend Fog::Attributes::ClassMethods
  include Fog::Attributes::InstanceMethods
  include Fog::Core::DeprecatedConnectionAccessors
end
module Fog::Mock
  def self.delay; end
  def self.delay=(new_delay); end
  def self.not_implemented(message = nil); end
  def self.random_base64(length); end
  def self.random_hex(length); end
  def self.random_ip(opts = nil); end
  def self.random_letters(length); end
  def self.random_letters_and_numbers(length); end
  def self.random_numbers(length); end
  def self.random_selection(characters, length); end
  def self.reset; end
end
module Fog::Provider
  def [](service_key); end
  def self.extended(base); end
  def service(new_service, constant_string); end
  def service_klass(constant_string); end
  def services; end
end
module Fog::Core::Utils
  def self.prepare_service_settings(settings); end
end
class Fog::Service
  def self.camel_case_collection_name(collection); end
  def self.coerce_options(options); end
  def self.collection(new_collection, path = nil); end
  def self.collection_files; end
  def self.collections; end
  def self.fetch_credentials(_options); end
  def self.handle_settings(settings); end
  def self.inherited(child); end
  def self.mocked_requests; end
  def self.model(new_model, path = nil); end
  def self.model_files; end
  def self.model_path(new_path); end
  def self.models; end
  def self.new(config = nil); end
  def self.recognized; end
  def self.recognizes(*args); end
  def self.request(new_request, path = nil); end
  def self.request_path(new_path); end
  def self.requests; end
  def self.require_collections_and_define; end
  def self.require_item(item, fallback_dir); end
  def self.require_models; end
  def self.require_requests_and_mock; end
  def self.requirements; end
  def self.requires(*args); end
  def self.secrets(*args); end
  def self.setup_requirements; end
  def self.validate_options(options); end
end
class Fog::Service::Error < Fog::Errors::Error
end
class Fog::Service::NotFound < Fog::Errors::NotFound
end
module Fog::Service::NoLeakInspector
  def inspect; end
end
module Fog::Service::Collections
  def collections; end
  def mocked_requests; end
  def requests; end
end
module Fog::SSH
  def self.new(address, username, options = nil); end
end
class Fog::SSH::Mock
  def initialize(address, username, options); end
  def run(commands, &_blk); end
  def self.data; end
  def self.reset; end
end
class Fog::SSH::Real
  def assert_net_ssh_loaded; end
  def build_options(options); end
  def initialize(address, username, options); end
  def merge_default_options_into(options); end
  def run(commands, &blk); end
  def validate_options(options); end
end
class Fog::SSH::Result
  def command; end
  def command=(arg0); end
  def display_stderr; end
  def display_stdout; end
  def initialize(command); end
  def status; end
  def status=(arg0); end
  def stderr; end
  def stderr=(arg0); end
  def stdout; end
  def stdout=(arg0); end
end
module Fog::SCP
  def self.new(address, username, options = nil); end
end
class Fog::SCP::Mock
  def download(remote_path, local_path, download_options = nil); end
  def initialize(address, username, options); end
  def self.data; end
  def upload(local_path, remote_path, upload_options = nil); end
end
class Fog::SCP::Real
  def download(remote_path, local_path, download_options = nil, &block); end
  def initialize(address, username, options); end
  def upload(local_path, remote_path, upload_options = nil, &block); end
end
class Fog::Time < Time
  def self.now; end
  def self.now=(new_now); end
  def self.offset; end
  def to_date_header; end
  def to_iso8601_basic; end
end
class Fog::UUID
  def self.supported?; end
  def self.uuid; end
end
module Fog::StringifyKeys
  def self.stringify(original_hash); end
  def self.transform_hash(original, &block); end
end
module Fog::WhitelistKeys
  def self.whitelist(hash, valid_keys); end
end
module Fog::Account
  extend Fog::ServicesMixin
end
module Fog::Baremetal
  extend Fog::ServicesMixin
end
module Fog::Billing
  extend Fog::ServicesMixin
end
module Fog::CDN
  extend Fog::ServicesMixin
end
module Fog::Compute
  def self.new(orig_attributes); end
  def self.servers; end
  extend Fog::ServicesMixin
end
module Fog::DNS
  def self.zones; end
  extend Fog::ServicesMixin
end
module Fog::Identity
  extend Fog::ServicesMixin
end
module Fog::Image
  extend Fog::ServicesMixin
end
module Fog::Introspection
  extend Fog::ServicesMixin
end
module Fog::Metering
  extend Fog::ServicesMixin
end
module Fog::Monitoring
  extend Fog::ServicesMixin
end
module Fog::NFV
  extend Fog::ServicesMixin
end
module Fog::Network
  extend Fog::ServicesMixin
end
module Fog::Orchestration
  extend Fog::ServicesMixin
end
module Fog::Storage
  def self.directories; end
  def self.get_body_size(body); end
  def self.get_content_type(data); end
  def self.parse_data(data); end
  extend Fog::ServicesMixin
end
module Fog::Support
  extend Fog::ServicesMixin
end
module Fog::Volume
  extend Fog::ServicesMixin
end
module Fog::VPN
  extend Fog::ServicesMixin
end
module Fog::Formatador
  def self.attribute_string(object); end
  def self.display_compact_table(hashes, keys = nil, &block); end
  def self.display_line(data); end
  def self.display_lines(data); end
  def self.display_table(hashes, keys = nil, &block); end
  def self.format(object, opts = nil); end
  def self.formatador; end
  def self.indent(&block); end
  def self.indentation; end
  def self.init_string(object); end
  def self.inspect_object(object); end
  def self.nested_objects_string(object); end
  def self.object_attributes(object); end
  def self.object_string(object, opts); end
  def self.redisplay_progressbar(current, total, options = nil); end
end
