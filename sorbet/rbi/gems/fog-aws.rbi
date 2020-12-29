# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/fog-aws/all/fog-aws.rbi
#
# fog-aws-3.5.2

module Fog
end
module Fog::AWS
  def self.escape(string); end
  def self.indexed_filters(filters); end
  def self.indexed_param(key, values); end
  def self.indexed_request_param(name, values); end
  def self.json_response?(response); end
  def self.parse_security_group_options(group_name, options); end
  def self.regions; end
  def self.serialize_keys(key, value, options = nil); end
  def self.signed_params(params, options = nil); end
  def self.signed_params_v4(params, headers, options = nil); end
  def self.validate_region!(region, host = nil); end
  extend Fog::Provider
end
module Fog::AWS::CredentialFetcher
end
module Fog::AWS::CredentialFetcher::ServiceMethods
  def fetch_credentials(options); end
end
module Fog::AWS::CredentialFetcher::ConnectionMethods
  def credentials_expired?; end
  def refresh_credentials; end
  def refresh_credentials_if_expired; end
end
class Fog::AWS::AutoScaling::Error < Fog::Service::Error
end
class Fog::AWS::AutoScaling::NotFound < Fog::Service::NotFound
end
module Fog::AWS::AutoScaling::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::AutoScaling < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::AutoScaling::IdentifierTaken < Fog::Errors::Error
end
class Fog::AWS::AutoScaling::ResourceInUse < Fog::Errors::Error
end
class Fog::AWS::AutoScaling::ValidationError < Fog::Errors::Error
end
class Fog::AWS::AutoScaling::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def region; end
  def region=(arg0); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::AutoScaling::Mock
  def data; end
  def initialize(options = nil); end
  def region; end
  def region=(arg0); end
  def region_data; end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::ElasticBeanstalk::Error < Fog::Service::Error
end
class Fog::AWS::ElasticBeanstalk::NotFound < Fog::Service::NotFound
end
module Fog::AWS::ElasticBeanstalk::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::ElasticBeanstalk < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::ElasticBeanstalk::InvalidParameterError < Fog::Errors::Error
end
class Fog::AWS::ElasticBeanstalk::Mock
  def initialize(options = nil); end
end
class Fog::AWS::ElasticBeanstalk::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  def solution_stacks; end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::CDN::Error < Fog::Service::Error
end
class Fog::AWS::CDN::NotFound < Fog::Service::NotFound
end
module Fog::AWS::CDN::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::CDN < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::CDN::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.distribution_id; end
  def self.domain_name; end
  def self.error(code, argument = nil); end
  def self.generic_id; end
  def self.raise_error(status, code, message = nil); end
  def self.random_id(length); end
  def self.reset; end
  def setup_credentials(options = nil); end
  def signature(params); end
end
class Fog::AWS::CDN::Real
  def _request(params, &block); end
  def initialize(options = nil); end
  def reload; end
  def request(params, &block); end
  def setup_credentials(options); end
  def signature(params); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
module Fog::CDN
end
class Fog::CDN::AWS::Error < Fog::Service::Error
end
class Fog::CDN::AWS::NotFound < Fog::Service::NotFound
end
module Fog::CDN::AWS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::CDN::AWS < Fog::AWS::CDN
  def self.new(*arg0); end
  def self.service; end
end
class Fog::AWS::CloudFormation::Error < Fog::Service::Error
end
class Fog::AWS::CloudFormation::NotFound < Fog::Service::NotFound
end
module Fog::AWS::CloudFormation::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::CloudFormation < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::CloudFormation::Mock
  def initialize(options = nil); end
end
class Fog::AWS::CloudFormation::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::CloudWatch::Error < Fog::Service::Error
end
class Fog::AWS::CloudWatch::NotFound < Fog::Service::NotFound
end
module Fog::AWS::CloudWatch::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::CloudWatch < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::CloudWatch::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.reset; end
end
class Fog::AWS::CloudWatch::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Compute::Error < Fog::Service::Error
end
class Fog::AWS::Compute::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Compute::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Compute < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::Compute::RequestLimitExceeded < Fog::Errors::Error
end
class Fog::AWS::Compute::InvalidURIError < Exception
end
class Fog::AWS::Compute::Real
  def _request(body, headers, idempotent, parser, retries = nil); end
  def initialize(options = nil); end
  def modify_image_attributes(*params); end
  def region; end
  def region=(arg0); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  def supported_platforms; end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Compute::Mock
  def apply_tag_filters(resources, filters, resource_id_key); end
  def data; end
  def default_vpc; end
  def default_vpc=(value); end
  def disable_ec2_classic; end
  def enable_ec2_classic; end
  def initialize(options = nil); end
  def region; end
  def region=(arg0); end
  def region_data; end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def set_supported_platforms(values); end
  def setup_credentials(options); end
  def setup_default_vpc!; end
  def supported_platforms; end
  def tagged_resources(resources); end
  def visible_images; end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
module Fog::Compute
end
class Fog::Compute::AWS::Error < Fog::Service::Error
end
class Fog::Compute::AWS::NotFound < Fog::Service::NotFound
end
module Fog::Compute::AWS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::Compute::AWS < Fog::AWS::Compute
  def self.new(*arg0); end
  def self.service; end
end
class Fog::AWS::DataPipeline::Error < Fog::Service::Error
end
class Fog::AWS::DataPipeline::NotFound < Fog::Service::NotFound
end
module Fog::AWS::DataPipeline::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::DataPipeline < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::DataPipeline::Mock
  def data; end
  def find_pipeline(id); end
  def initialize(options = nil); end
  def region; end
  def region=(arg0); end
  def reset; end
  def self.data; end
  def self.reset; end
  def stringify_keys(object); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::DataPipeline::Real
  def _request(params); end
  def initialize(options = nil); end
  def owner_id; end
  def region; end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::DNS::Error < Fog::Service::Error
end
class Fog::AWS::DNS::NotFound < Fog::Service::NotFound
end
module Fog::AWS::DNS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::DNS < Fog::Service
  def self.change_resource_record_sets_data(zone_id, change_batch, version, options = nil); end
  def self.elb_dualstack_hosted_zone_mapping; end
  def self.elb_hosted_zone_mapping; end
  def self.hosted_zone_for_alias_target(dns_name); end
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::DNS::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
  def signature(params); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::DNS::Real
  def _request(params, &block); end
  def initialize(options = nil); end
  def reload; end
  def request(params, &block); end
  def setup_credentials(options); end
  def signature(params); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
module Fog::DNS
end
class Fog::DNS::AWS::Error < Fog::Service::Error
end
class Fog::DNS::AWS::NotFound < Fog::Service::NotFound
end
module Fog::DNS::AWS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::DNS::AWS < Fog::AWS::DNS
  def self.new(*arg0); end
  def self.service; end
end
class Fog::AWS::DynamoDB::Error < Fog::Service::Error
end
class Fog::AWS::DynamoDB::NotFound < Fog::Service::NotFound
end
module Fog::AWS::DynamoDB::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::DynamoDB < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::DynamoDB::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
end
class Fog::AWS::DynamoDB::Real
  def _request(params); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Elasticache::Error < Fog::Service::Error
end
class Fog::AWS::Elasticache::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Elasticache::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Elasticache < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::Elasticache::IdentifierTaken < Fog::Errors::Error
end
class Fog::AWS::Elasticache::InvalidInstance < Fog::Errors::Error
end
class Fog::AWS::Elasticache::AuthorizationAlreadyExists < Fog::Errors::Error
end
class Fog::AWS::Elasticache::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Elasticache::Mock
  def create_cache_nodes(cluster_id, num_nodes = nil, port = nil); end
  def data; end
  def initialize(options = nil); end
  def region_data; end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::ECS::Error < Fog::Service::Error
end
class Fog::AWS::ECS::NotFound < Fog::Service::NotFound
end
module Fog::AWS::ECS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::ECS < Fog::Service
  def self.service; end
end
class Fog::AWS::ECS::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def region; end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::ECS::Mock
  def data; end
  def initialize(options = nil); end
  def region; end
  def region=(arg0); end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
end
class Fog::AWS::EFS::Error < Fog::Service::Error
end
class Fog::AWS::EFS::NotFound < Fog::Service::NotFound
end
module Fog::AWS::EFS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::EFS < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::EFS::FileSystemInUse < Fog::Errors::Error
end
class Fog::AWS::EFS::IncorrectFileSystemLifeCycleState < Fog::Errors::Error
end
class Fog::AWS::EFS::InvalidSubnet < Fog::Errors::Error
end
class Fog::AWS::EFS::Mock
  def data; end
  def initialize(options = nil); end
  def mock_compute; end
  def region; end
  def region=(arg0); end
  def reset; end
  def self.data; end
  def self.reset; end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::EFS::Real
  def _request(body, headers, idempotent, parser, method, path, expects); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::ELB::Mock
  def data; end
  def initialize(options = nil); end
  def region; end
  def reset_data; end
  def self.data; end
  def self.dns_name(name, region); end
  def self.reset; end
  def setup_credentials(options); end
end
class Fog::AWS::ELB::Error < Fog::Service::Error
end
class Fog::AWS::ELB::NotFound < Fog::Service::NotFound
end
module Fog::AWS::ELB::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::ELB < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::ELB::DuplicatePolicyName < Fog::Errors::Error
end
class Fog::AWS::ELB::IdentifierTaken < Fog::Errors::Error
end
class Fog::AWS::ELB::InvalidInstance < Fog::Errors::Error
end
class Fog::AWS::ELB::InvalidConfigurationRequest < Fog::Errors::Error
end
class Fog::AWS::ELB::PolicyNotFound < Fog::Errors::Error
end
class Fog::AWS::ELB::PolicyTypeNotFound < Fog::Errors::Error
end
class Fog::AWS::ELB::Throttled < Fog::Errors::Error
end
class Fog::AWS::ELB::TooManyPolicies < Fog::Errors::Error
end
class Fog::AWS::ELB::ValidationError < Fog::Errors::Error
end
class Fog::AWS::ELB::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def region; end
  def reload; end
  def request(params); end
  def setup_credentials(options = nil); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::EMR::Error < Fog::Service::Error
end
class Fog::AWS::EMR::NotFound < Fog::Service::NotFound
end
module Fog::AWS::EMR::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::EMR < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::EMR::IdentifierTaken < Fog::Errors::Error
end
class Fog::AWS::EMR::Mock
  def initialize(options = nil); end
end
class Fog::AWS::EMR::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Federation::Error < Fog::Service::Error
end
class Fog::AWS::Federation::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Federation::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Federation < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::Federation::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.reset; end
end
class Fog::AWS::Federation::Real
  def initialize(options = nil); end
  def request(action, session); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Glacier::Error < Fog::Service::Error
end
class Fog::AWS::Glacier::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Glacier::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Glacier < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::Glacier::TreeHash
  def add_part(bytes); end
  def digest; end
  def digest_for_part(body); end
  def hexdigest; end
  def initialize; end
  def prepare_body_for_slice(body); end
  def reduce_digest_stack(digest, stack); end
  def self.digest(body); end
  def update_digest_stack(digest, stack); end
end
class Fog::AWS::Glacier::Mock
  def initialize(options = nil); end
end
class Fog::AWS::Glacier::Real
  def _request(params, &block); end
  def initialize(options = nil); end
  def request(params, &block); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::IAM < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::IAM::Mock
  def account_id; end
  def current_user; end
  def current_user_name; end
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.default_policies; end
  def self.default_policy_versions; end
  def self.reset; end
  def self.server_certificate_id; end
  def setup_credentials(options); end
end
class Fog::AWS::IAM::Error < Fog::Service::Error
end
class Fog::AWS::IAM::NotFound < Fog::Service::NotFound
end
module Fog::AWS::IAM::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::IAM::EntityAlreadyExists < Fog::AWS::IAM::Error
end
class Fog::AWS::IAM::KeyPairMismatch < Fog::AWS::IAM::Error
end
class Fog::AWS::IAM::LimitExceeded < Fog::AWS::IAM::Error
end
class Fog::AWS::IAM::MalformedCertificate < Fog::AWS::IAM::Error
end
class Fog::AWS::IAM::ValidationError < Fog::AWS::IAM::Error
end
class Fog::AWS::IAM::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Kinesis::Error < Fog::Service::Error
end
class Fog::AWS::Kinesis::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Kinesis::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Kinesis < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::Kinesis::ExpiredIterator < Fog::Errors::Error
end
class Fog::AWS::Kinesis::LimitExceeded < Fog::Errors::Error
end
class Fog::AWS::Kinesis::ResourceInUse < Fog::Errors::Error
end
class Fog::AWS::Kinesis::ResourceNotFound < Fog::Errors::Error
end
class Fog::AWS::Kinesis::InvalidArgument < Fog::Errors::Error
end
class Fog::AWS::Kinesis::ProvisionedThroughputExceeded < Fog::Errors::Error
end
class Fog::AWS::Kinesis::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Kinesis::Mock
  def data; end
  def initialize(options = nil); end
  def mutex; end
  def next_sequence_number; end
  def next_shard_id; end
  def reset_data; end
  def self.data; end
  def self.mutex; end
  def self.next_sequence_number; end
  def self.next_shard_id; end
  def self.reset; end
end
class Fog::AWS::KMS::Error < Fog::Service::Error
end
class Fog::AWS::KMS::NotFound < Fog::Service::NotFound
end
module Fog::AWS::KMS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::KMS < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::KMS::DependencyTimeoutException < Fog::Errors::Error
end
class Fog::AWS::KMS::DisabledException < Fog::Errors::Error
end
class Fog::AWS::KMS::InvalidArnException < Fog::Errors::Error
end
class Fog::AWS::KMS::InvalidGrantTokenException < Fog::Errors::Error
end
class Fog::AWS::KMS::InvalidKeyUsageException < Fog::Errors::Error
end
class Fog::AWS::KMS::KMSInternalException < Fog::Errors::Error
end
class Fog::AWS::KMS::KeyUnavailableException < Fog::Errors::Error
end
class Fog::AWS::KMS::MalformedPolicyDocumentException < Fog::Errors::Error
end
class Fog::AWS::KMS::NotFoundException < Fog::Errors::Error
end
class Fog::AWS::KMS::Mock
  def account_id; end
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
end
class Fog::AWS::KMS::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options = nil); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Lambda::Error < Fog::Service::Error
end
class Fog::AWS::Lambda::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Lambda::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Lambda < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::Lambda::Mock
  def account_id; end
  def aws_access_key_id; end
  def data; end
  def initialize(options = nil); end
  def region; end
  def reset_data; end
  def self.data; end
end
class Fog::AWS::Lambda::Real
  def _request(method, path, query, body, headers, expects, idempotent, parser = nil); end
  def initialize(options = nil); end
  def process_response(response, parser); end
  def region; end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::RDS::Error < Fog::Service::Error
end
class Fog::AWS::RDS::NotFound < Fog::Service::NotFound
end
module Fog::AWS::RDS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::RDS < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::RDS::IdentifierTaken < Fog::Errors::Error
end
class Fog::AWS::RDS::InvalidParameterCombination < Fog::Errors::Error
end
class Fog::AWS::RDS::AuthorizationAlreadyExists < Fog::Errors::Error
end
class Fog::AWS::RDS::Mock
  def aws_access_key_id; end
  def aws_access_key_id=(arg0); end
  def data; end
  def initialize(options = nil); end
  def region; end
  def region=(arg0); end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
end
class Fog::AWS::RDS::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def owner_id; end
  def region; end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Redshift::Error < Fog::Service::Error
end
class Fog::AWS::Redshift::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Redshift::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Redshift < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::Redshift::Mock
  def initialize(options = nil); end
end
class Fog::AWS::Redshift::Real
  def _request(params, &block); end
  def initialize(options = nil); end
  def request(params, &block); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::SES::Error < Fog::Service::Error
end
class Fog::AWS::SES::NotFound < Fog::Service::NotFound
end
module Fog::AWS::SES::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::SES < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::SES::InvalidParameterError < Fog::Errors::Error
end
class Fog::AWS::SES::MessageRejected < Fog::Errors::Error
end
class Fog::AWS::SES::Mock
  def initialize(options = nil); end
end
class Fog::AWS::SES::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::SimpleDB::Error < Fog::Service::Error
end
class Fog::AWS::SimpleDB::NotFound < Fog::Service::NotFound
end
module Fog::AWS::SimpleDB::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::SimpleDB < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::SimpleDB::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
end
class Fog::AWS::SimpleDB::Real
  def _request(body, idempotent, parser); end
  def encode_attribute_names(attributes); end
  def encode_attributes(attributes, replace_attributes = nil, expected_attributes = nil); end
  def encode_batch_attributes(items, replace_attributes = nil); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def sdb_encode(value); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::SNS::Error < Fog::Service::Error
end
class Fog::AWS::SNS::NotFound < Fog::Service::NotFound
end
module Fog::AWS::SNS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::SNS < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::SNS::Mock
  def account_id=(arg0); end
  def data; end
  def initialize(options = nil); end
  def region; end
  def reset_data; end
  def self.data; end
end
class Fog::AWS::SNS::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def region; end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::SQS::Error < Fog::Service::Error
end
class Fog::AWS::SQS::NotFound < Fog::Service::NotFound
end
module Fog::AWS::SQS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::SQS < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::SQS::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
end
class Fog::AWS::SQS::Real
  def _request(body, headers, idempotent, parser, path); end
  def initialize(options = nil); end
  def path_from_queue_url(queue_url); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Storage::Error < Fog::Service::Error
end
class Fog::AWS::Storage::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Storage::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Storage < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
module Fog::AWS::Storage::Utils
  def bucket_to_path(bucket_name, path = nil); end
  def cdn; end
  def escape(string); end
  def http_url(params, expires); end
  def https_url(params, expires); end
  def object_to_path(object_name = nil); end
  def params_to_url(params); end
  def region; end
  def region=(arg0); end
  def region_to_host(region = nil); end
  def request_params(params); end
  def request_url(params); end
  def require_mime_types; end
  def signed_url(params, expires); end
  def url(params, expires); end
  def v2_signed_params_for_url(params, expires); end
  def v4_signed_params_for_url(params, expires); end
  def validate_signature_version!; end
end
class Fog::AWS::Storage::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.acls(type); end
  def self.data; end
  def self.reset; end
  def setup_credentials(options); end
  def signature_v2(params, expires); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
  include Fog::AWS::Storage::Utils
end
class Fog::AWS::Storage::Real
  def _request(scheme, host, port, params, original_params, &block); end
  def connection(scheme, host, port); end
  def initialize(options = nil); end
  def reload; end
  def request(params, &block); end
  def setup_credentials(options); end
  def signature_v2(params, expires); end
  def stringify_query_keys(params); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
  include Fog::AWS::Storage::Utils
end
class Fog::AWS::Storage::Real::S3Streamer
  def body; end
  def body=(arg0); end
  def call; end
  def date; end
  def date=(arg0); end
  def finished; end
  def finished=(arg0); end
  def initial_signature; end
  def initial_signature=(arg0); end
  def initialize(body, signature, signer, date); end
  def next_chunk; end
  def rewind; end
  def sign_chunk(data, previous_signature); end
  def signature; end
  def signature=(arg0); end
  def signer; end
  def signer=(arg0); end
end
module Fog::Storage
end
class Fog::Storage::AWS::Error < Fog::Service::Error
end
class Fog::Storage::AWS::NotFound < Fog::Service::NotFound
end
module Fog::Storage::AWS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::Storage::AWS < Fog::AWS::Storage
  def self.new(*arg0); end
  def self.service; end
end
class Fog::AWS::STS::Error < Fog::Service::Error
end
class Fog::AWS::STS::NotFound < Fog::Service::NotFound
end
module Fog::AWS::STS::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::STS < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::STS::EntityAlreadyExists < Fog::AWS::STS::Error
end
class Fog::AWS::STS::ValidationError < Fog::AWS::STS::Error
end
class Fog::AWS::STS::AwsAccessKeysMissing < Fog::AWS::STS::Error
end
class Fog::AWS::STS::Mock
  def data; end
  def initialize(options = nil); end
  def reset_data; end
  def self.data; end
  def self.reset; end
  def self.server_certificate_id; end
  def setup_credentials(options); end
end
class Fog::AWS::STS::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def request_unsigned(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
class Fog::AWS::Support::Error < Fog::Service::Error
end
class Fog::AWS::Support::NotFound < Fog::Service::NotFound
end
module Fog::AWS::Support::Collections
  def service; end
  include Fog::Service::Collections
end
class Fog::AWS::Support < Fog::Service
  def self.service; end
  extend Fog::AWS::CredentialFetcher::ServiceMethods
end
class Fog::AWS::Support::Mock
  def data; end
  def initialize(options = nil); end
  def region; end
  def region=(arg0); end
  def reset; end
  def self.data; end
  def self.reset; end
end
class Fog::AWS::Support::Real
  def _request(body, headers, idempotent, parser); end
  def initialize(options = nil); end
  def reload; end
  def request(params); end
  def setup_credentials(options); end
  include Fog::AWS::CredentialFetcher::ConnectionMethods
end
