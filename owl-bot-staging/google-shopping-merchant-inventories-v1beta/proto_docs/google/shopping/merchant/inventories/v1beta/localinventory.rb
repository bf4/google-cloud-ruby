# frozen_string_literal: true

# Copyright 2024 Google LLC
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


module Google
  module Shopping
    module Merchant
      module Inventories
        module V1beta
          # Local inventory information for the product. Represents in-store information
          # for a specific product at the store specified by
          # {::Google::Shopping::Merchant::Inventories::V1beta::LocalInventory#store_code `storeCode`}.
          # For a list of all accepted attribute values, see the [local product inventory
          # feed specification](https://support.google.com/merchants/answer/3061342).
          # @!attribute [r] name
          #   @return [::String]
          #     Output only. The name of the `LocalInventory` resource.
          #     Format:
          #     `accounts/{account}/products/{product}/localInventories/{store_code}`
          # @!attribute [r] account
          #   @return [::Integer]
          #     Output only. The account that owns the product. This field will be ignored
          #     if set by the client.
          # @!attribute [rw] store_code
          #   @return [::String]
          #     Required. Immutable. Store code (the store ID from your Business Profile)
          #     of the physical store the product is sold in. See the [Local product
          #     inventory feed
          #     specification](https://support.google.com/merchants/answer/3061342) for
          #     more information.
          # @!attribute [rw] price
          #   @return [::Google::Shopping::Type::Price]
          #     Price of the product at this store.
          # @!attribute [rw] sale_price
          #   @return [::Google::Shopping::Type::Price]
          #     Sale price of the product at this store. Mandatory if
          #     {::Google::Shopping::Merchant::Inventories::V1beta::LocalInventory#sale_price_effective_date `salePriceEffectiveDate`}
          #     is defined.
          # @!attribute [rw] sale_price_effective_date
          #   @return [::Google::Type::Interval]
          #     The `TimePeriod` of the
          #     sale at this store.
          # @!attribute [rw] availability
          #   @return [::String]
          #     Availability of the product at this store.
          #     For accepted attribute values, see the [local product inventory feed
          #     specification](https://support.google.com/merchants/answer/3061342)
          # @!attribute [rw] quantity
          #   @return [::Integer]
          #     Quantity of the product available at this store. Must be greater than or
          #     equal to zero.
          # @!attribute [rw] pickup_method
          #   @return [::String]
          #     Supported pickup method for this product. Unless the value is `"not
          #     supported"`, this field must be submitted together with
          #     `pickupSla`.
          #     For accepted attribute values, see the [local product inventory feed
          #     specification](https://support.google.com/merchants/answer/3061342)
          # @!attribute [rw] pickup_sla
          #   @return [::String]
          #     Relative time period from the order date for an order for this product,
          #     from this store, to be ready for pickup. Must be submitted with
          #     `pickupMethod`.
          #     For accepted attribute values, see the [local product inventory feed
          #     specification](https://support.google.com/merchants/answer/3061342)
          # @!attribute [rw] instore_product_location
          #   @return [::String]
          #     Location of the product inside the store. Maximum length is 20 bytes.
          # @!attribute [rw] custom_attributes
          #   @return [::Array<::Google::Shopping::Type::CustomAttribute>]
          #     A list of custom (merchant-provided) attributes. You can also use
          #     `CustomAttribute` to submit any attribute of the feed specification in its
          #     generic form.
          class LocalInventory
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for the `ListLocalInventories` method.
          # @!attribute [rw] parent
          #   @return [::String]
          #     Required. The `name` of the parent product to list local inventories for.
          #     Format:
          #     `accounts/{account}/products/{product}`
          # @!attribute [rw] page_size
          #   @return [::Integer]
          #     The maximum number of `LocalInventory` resources for the given
          #     product to return. The service returns fewer than this value if the number
          #     of inventories for the given product is less that than the `pageSize`. The
          #     default value is 25000. The maximum value is 25000; If a value higher than
          #     the maximum is specified, then the `pageSize` will default to the maximum
          # @!attribute [rw] page_token
          #   @return [::String]
          #     A page token, received from a previous `ListLocalInventories` call.
          #     Provide the page token to retrieve the subsequent page.
          #
          #     When paginating, all other parameters provided to `ListLocalInventories`
          #     must match the call that provided the page token. The token returned as
          #     {::Google::Shopping::Merchant::Inventories::V1beta::ListLocalInventoriesResponse#next_page_token nextPageToken}
          #     in the response to the previous request.
          class ListLocalInventoriesRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for the `ListLocalInventories` method.
          # @!attribute [rw] local_inventories
          #   @return [::Array<::Google::Shopping::Merchant::Inventories::V1beta::LocalInventory>]
          #     The `LocalInventory` resources for the given product from the specified
          #     account.
          # @!attribute [rw] next_page_token
          #   @return [::String]
          #     A token, which can be sent as `pageToken` to retrieve the next page.
          #     If this field is omitted, there are no subsequent pages.
          class ListLocalInventoriesResponse
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for the `InsertLocalInventory` method.
          # @!attribute [rw] parent
          #   @return [::String]
          #     Required. The account and product where this inventory will be inserted.
          #     Format: `accounts/{account}/products/{product}`
          # @!attribute [rw] local_inventory
          #   @return [::Google::Shopping::Merchant::Inventories::V1beta::LocalInventory]
          #     Required. Local inventory information of the product. If the product
          #     already has a `LocalInventory` resource for the same `storeCode`, full
          #     replacement of the `LocalInventory` resource is performed.
          class InsertLocalInventoryRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for the `DeleteLocalInventory` method.
          # @!attribute [rw] name
          #   @return [::String]
          #     Required. The name of the local inventory for the given product to delete.
          #     Format:
          #     `accounts/{account}/products/{product}/localInventories/{store_code}`
          class DeleteLocalInventoryRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
