# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Grafeas
  module V1
    # Common Vulnerability Scoring System version 3.
    # For details, see https://www.first.org/cvss/specification-document
    # @!attribute [rw] base_score
    #   @return [::Float]
    #     The base score is a function of the base metric scores.
    # @!attribute [rw] exploitability_score
    #   @return [::Float]
    # @!attribute [rw] impact_score
    #   @return [::Float]
    # @!attribute [rw] attack_vector
    #   @return [::Grafeas::V1::CVSSv3::AttackVector]
    #     Base Metrics
    #     Represents the intrinsic characteristics of a vulnerability that are
    #     constant over time and across user environments.
    # @!attribute [rw] attack_complexity
    #   @return [::Grafeas::V1::CVSSv3::AttackComplexity]
    # @!attribute [rw] privileges_required
    #   @return [::Grafeas::V1::CVSSv3::PrivilegesRequired]
    # @!attribute [rw] user_interaction
    #   @return [::Grafeas::V1::CVSSv3::UserInteraction]
    # @!attribute [rw] scope
    #   @return [::Grafeas::V1::CVSSv3::Scope]
    # @!attribute [rw] confidentiality_impact
    #   @return [::Grafeas::V1::CVSSv3::Impact]
    # @!attribute [rw] integrity_impact
    #   @return [::Grafeas::V1::CVSSv3::Impact]
    # @!attribute [rw] availability_impact
    #   @return [::Grafeas::V1::CVSSv3::Impact]
    class CVSSv3
      include ::Google::Protobuf::MessageExts
      extend ::Google::Protobuf::MessageExts::ClassMethods

      module AttackVector
      ATTACK_VECTOR_UNSPECIFIED = 0

        ATTACK_VECTOR_NETWORK = 1

        ATTACK_VECTOR_ADJACENT = 2

        ATTACK_VECTOR_LOCAL = 3

        ATTACK_VECTOR_PHYSICAL = 4
      end

      module AttackComplexity
      ATTACK_COMPLEXITY_UNSPECIFIED = 0

        ATTACK_COMPLEXITY_LOW = 1

        ATTACK_COMPLEXITY_HIGH = 2
      end

      module PrivilegesRequired
      PRIVILEGES_REQUIRED_UNSPECIFIED = 0

        PRIVILEGES_REQUIRED_NONE = 1

        PRIVILEGES_REQUIRED_LOW = 2

        PRIVILEGES_REQUIRED_HIGH = 3
      end

      module UserInteraction
      USER_INTERACTION_UNSPECIFIED = 0

        USER_INTERACTION_NONE = 1

        USER_INTERACTION_REQUIRED = 2
      end

      module Scope
      SCOPE_UNSPECIFIED = 0

        SCOPE_UNCHANGED = 1

        SCOPE_CHANGED = 2
      end

      module Impact
      IMPACT_UNSPECIFIED = 0

        IMPACT_HIGH = 1

        IMPACT_LOW = 2

        IMPACT_NONE = 3
      end
    end

    # Common Vulnerability Scoring System.
    # For details, see https://www.first.org/cvss/specification-document
    # This is a message we will try to use for storing various versions of CVSS
    # rather than making a separate proto for storing a specific version.
    # @!attribute [rw] base_score
    #   @return [::Float]
    #     The base score is a function of the base metric scores.
    # @!attribute [rw] exploitability_score
    #   @return [::Float]
    # @!attribute [rw] impact_score
    #   @return [::Float]
    # @!attribute [rw] attack_vector
    #   @return [::Grafeas::V1::CVSS::AttackVector]
    #     Base Metrics
    #     Represents the intrinsic characteristics of a vulnerability that are
    #     constant over time and across user environments.
    # @!attribute [rw] attack_complexity
    #   @return [::Grafeas::V1::CVSS::AttackComplexity]
    # @!attribute [rw] authentication
    #   @return [::Grafeas::V1::CVSS::Authentication]
    # @!attribute [rw] privileges_required
    #   @return [::Grafeas::V1::CVSS::PrivilegesRequired]
    # @!attribute [rw] user_interaction
    #   @return [::Grafeas::V1::CVSS::UserInteraction]
    # @!attribute [rw] scope
    #   @return [::Grafeas::V1::CVSS::Scope]
    # @!attribute [rw] confidentiality_impact
    #   @return [::Grafeas::V1::CVSS::Impact]
    # @!attribute [rw] integrity_impact
    #   @return [::Grafeas::V1::CVSS::Impact]
    # @!attribute [rw] availability_impact
    #   @return [::Grafeas::V1::CVSS::Impact]
    class CVSS
      include ::Google::Protobuf::MessageExts
      extend ::Google::Protobuf::MessageExts::ClassMethods

      module AttackVector
      ATTACK_VECTOR_UNSPECIFIED = 0

        ATTACK_VECTOR_NETWORK = 1

        ATTACK_VECTOR_ADJACENT = 2

        ATTACK_VECTOR_LOCAL = 3

        ATTACK_VECTOR_PHYSICAL = 4
      end

      module AttackComplexity
      ATTACK_COMPLEXITY_UNSPECIFIED = 0

        ATTACK_COMPLEXITY_LOW = 1

        ATTACK_COMPLEXITY_HIGH = 2
      end

      module Authentication
      AUTHENTICATION_UNSPECIFIED = 0

        AUTHENTICATION_MULTIPLE = 1

        AUTHENTICATION_SINGLE = 2

        AUTHENTICATION_NONE = 3
      end

      module PrivilegesRequired
      PRIVILEGES_REQUIRED_UNSPECIFIED = 0

        PRIVILEGES_REQUIRED_NONE = 1

        PRIVILEGES_REQUIRED_LOW = 2

        PRIVILEGES_REQUIRED_HIGH = 3
      end

      module UserInteraction
      USER_INTERACTION_UNSPECIFIED = 0

        USER_INTERACTION_NONE = 1

        USER_INTERACTION_REQUIRED = 2
      end

      module Scope
      SCOPE_UNSPECIFIED = 0

        SCOPE_UNCHANGED = 1

        SCOPE_CHANGED = 2
      end

      module Impact
      IMPACT_UNSPECIFIED = 0

        IMPACT_HIGH = 1

        IMPACT_LOW = 2

        IMPACT_NONE = 3
      end
    end

    # CVSS Version.
    module CVSSVersion

      CVSS_VERSION_UNSPECIFIED = 0

      CVSS_VERSION_2 = 1

      CVSS_VERSION_3 = 2
    end
  end
end

