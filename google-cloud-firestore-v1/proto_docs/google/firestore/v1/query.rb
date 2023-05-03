# frozen_string_literal: true

# Copyright 2023 Google LLC
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
  module Cloud
    module Firestore
      module V1
        # A Firestore query.
        # @!attribute [rw] select
        #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::Projection]
        #     The projection to return.
        # @!attribute [rw] from
        #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredQuery::CollectionSelector>]
        #     The collections to query.
        # @!attribute [rw] where
        #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::Filter]
        #     The filter to apply.
        # @!attribute [rw] order_by
        #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredQuery::Order>]
        #     The order to apply to the query results.
        #
        #     Firestore allows callers to provide a full ordering, a partial ordering, or
        #     no ordering at all. In all cases, Firestore guarantees a stable ordering
        #     through the following rules:
        #
        #      * The `order_by` is required to reference all fields used with an
        #        inequality filter.
        #      * All fields that are required to be in the `order_by` but are not already
        #        present are appended in lexicographical ordering of the field name.
        #      * If an order on `__name__` is not specified, it is appended by default.
        #
        #     Fields are appended with the same sort direction as the last order
        #     specified, or 'ASCENDING' if no order was specified. For example:
        #
        #      * `ORDER BY a` becomes `ORDER BY a ASC, __name__ ASC`
        #      * `ORDER BY a DESC` becomes `ORDER BY a DESC, __name__ DESC`
        #      * `WHERE a > 1` becomes `WHERE a > 1 ORDER BY a ASC, __name__ ASC`
        #      * `WHERE __name__ > ... AND a > 1` becomes
        #         `WHERE __name__ > ... AND a > 1 ORDER BY a ASC, __name__ ASC`
        # @!attribute [rw] start_at
        #   @return [::Google::Cloud::Firestore::V1::Cursor]
        #     A potential prefix of a position in the result set to start the query at.
        #
        #     The ordering of the result set is based on the `ORDER BY` clause of the
        #     original query.
        #
        #     ```
        #     SELECT * FROM k WHERE a = 1 AND b > 2 ORDER BY b ASC, __name__ ASC;
        #     ```
        #
        #     This query's results are ordered by `(b ASC, __name__ ASC)`.
        #
        #     Cursors can reference either the full ordering or a prefix of the location,
        #     though it cannot reference more fields than what are in the provided
        #     `ORDER BY`.
        #
        #     Continuing off the example above, attaching the following start cursors
        #     will have varying impact:
        #
        #     - `START BEFORE (2, /k/123)`: start the query right before `a = 1 AND
        #        b > 2 AND __name__ > /k/123`.
        #     - `START AFTER (10)`: start the query right after `a = 1 AND b > 10`.
        #
        #     Unlike `OFFSET` which requires scanning over the first N results to skip,
        #     a start cursor allows the query to begin at a logical position. This
        #     position is not required to match an actual result, it will scan forward
        #     from this position to find the next document.
        #
        #     Requires:
        #
        #     * The number of values cannot be greater than the number of fields
        #       specified in the `ORDER BY` clause.
        # @!attribute [rw] end_at
        #   @return [::Google::Cloud::Firestore::V1::Cursor]
        #     A potential prefix of a position in the result set to end the query at.
        #
        #     This is similar to `START_AT` but with it controlling the end position
        #     rather than the start position.
        #
        #     Requires:
        #
        #     * The number of values cannot be greater than the number of fields
        #       specified in the `ORDER BY` clause.
        # @!attribute [rw] offset
        #   @return [::Integer]
        #     The number of documents to skip before returning the first result.
        #
        #     This applies after the constraints specified by the `WHERE`, `START AT`, &
        #     `END AT` but before the `LIMIT` clause.
        #
        #     Requires:
        #
        #     * The value must be greater than or equal to zero if specified.
        # @!attribute [rw] limit
        #   @return [::Google::Protobuf::Int32Value]
        #     The maximum number of results to return.
        #
        #     Applies after all other constraints.
        #
        #     Requires:
        #
        #     * The value must be greater than or equal to zero if specified.
        class StructuredQuery
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # A selection of a collection, such as `messages as m1`.
          # @!attribute [rw] collection_id
          #   @return [::String]
          #     The collection ID.
          #     When set, selects only collections with this ID.
          # @!attribute [rw] all_descendants
          #   @return [::Boolean]
          #     When false, selects only collections that are immediate children of
          #     the `parent` specified in the containing `RunQueryRequest`.
          #     When true, selects all descendant collections.
          class CollectionSelector
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # A filter.
          # @!attribute [rw] composite_filter
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::CompositeFilter]
          #     A composite filter.
          # @!attribute [rw] field_filter
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldFilter]
          #     A filter on a document field.
          # @!attribute [rw] unary_filter
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::UnaryFilter]
          #     A filter that takes exactly one argument.
          class Filter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # A filter that merges multiple other filters using the given operator.
          # @!attribute [rw] op
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::CompositeFilter::Operator]
          #     The operator for combining multiple filters.
          # @!attribute [rw] filters
          #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredQuery::Filter>]
          #     The list of filters to combine.
          #
          #     Requires:
          #
          #     * At least one filter is present.
          class CompositeFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # A composite filter operator.
            module Operator
              # Unspecified. This value must not be used.
              OPERATOR_UNSPECIFIED = 0

              # Documents are required to satisfy all of the combined filters.
              AND = 1

              # Documents are required to satisfy at least one of the combined filters.
              OR = 2
            end
          end

          # A filter on a specific field.
          # @!attribute [rw] field
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference]
          #     The field to filter by.
          # @!attribute [rw] op
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldFilter::Operator]
          #     The operator to filter by.
          # @!attribute [rw] value
          #   @return [::Google::Cloud::Firestore::V1::Value]
          #     The value to compare to.
          class FieldFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # A field filter operator.
            module Operator
              # Unspecified. This value must not be used.
              OPERATOR_UNSPECIFIED = 0

              # The given `field` is less than the given `value`.
              #
              # Requires:
              #
              # * That `field` come first in `order_by`.
              LESS_THAN = 1

              # The given `field` is less than or equal to the given `value`.
              #
              # Requires:
              #
              # * That `field` come first in `order_by`.
              LESS_THAN_OR_EQUAL = 2

              # The given `field` is greater than the given `value`.
              #
              # Requires:
              #
              # * That `field` come first in `order_by`.
              GREATER_THAN = 3

              # The given `field` is greater than or equal to the given `value`.
              #
              # Requires:
              #
              # * That `field` come first in `order_by`.
              GREATER_THAN_OR_EQUAL = 4

              # The given `field` is equal to the given `value`.
              EQUAL = 5

              # The given `field` is not equal to the given `value`.
              #
              # Requires:
              #
              # * No other `NOT_EQUAL`, `NOT_IN`, `IS_NOT_NULL`, or `IS_NOT_NAN`.
              # * That `field` comes first in the `order_by`.
              NOT_EQUAL = 6

              # The given `field` is an array that contains the given `value`.
              ARRAY_CONTAINS = 7

              # The given `field` is equal to at least one value in the given array.
              #
              # Requires:
              #
              # * That `value` is a non-empty `ArrayValue` with at most 10 values.
              # * No other `IN` or `ARRAY_CONTAINS_ANY` or `NOT_IN`.
              IN = 8

              # The given `field` is an array that contains any of the values in the
              # given array.
              #
              # Requires:
              #
              # * That `value` is a non-empty `ArrayValue` with at most 10 values.
              # * No other `IN` or `ARRAY_CONTAINS_ANY` or `NOT_IN`.
              ARRAY_CONTAINS_ANY = 9

              # The value of the `field` is not in the given array.
              #
              # Requires:
              #
              # * That `value` is a non-empty `ArrayValue` with at most 10 values.
              # * No other `IN`, `ARRAY_CONTAINS_ANY`, `NOT_IN`, `NOT_EQUAL`,
              #   `IS_NOT_NULL`, or `IS_NOT_NAN`.
              # * That `field` comes first in the `order_by`.
              NOT_IN = 10
            end
          end

          # A filter with a single operand.
          # @!attribute [rw] op
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::UnaryFilter::Operator]
          #     The unary operator to apply.
          # @!attribute [rw] field
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference]
          #     The field to which to apply the operator.
          class UnaryFilter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # A unary operator.
            module Operator
              # Unspecified. This value must not be used.
              OPERATOR_UNSPECIFIED = 0

              # The given `field` is equal to `NaN`.
              IS_NAN = 2

              # The given `field` is equal to `NULL`.
              IS_NULL = 3

              # The given `field` is not equal to `NaN`.
              #
              # Requires:
              #
              # * No other `NOT_EQUAL`, `NOT_IN`, `IS_NOT_NULL`, or `IS_NOT_NAN`.
              # * That `field` comes first in the `order_by`.
              IS_NOT_NAN = 4

              # The given `field` is not equal to `NULL`.
              #
              # Requires:
              #
              # * A single `NOT_EQUAL`, `NOT_IN`, `IS_NOT_NULL`, or `IS_NOT_NAN`.
              # * That `field` comes first in the `order_by`.
              IS_NOT_NULL = 5
            end
          end

          # An order on a field.
          # @!attribute [rw] field
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference]
          #     The field to order by.
          # @!attribute [rw] direction
          #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::Direction]
          #     The direction to order by. Defaults to `ASCENDING`.
          class Order
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # A reference to a field in a document, ex: `stats.operations`.
          # @!attribute [rw] field_path
          #   @return [::String]
          #     The relative path of the document being referenced.
          #
          #     Requires:
          #
          #     * Conform to {::Google::Cloud::Firestore::V1::Document#fields document field name}
          #     limitations.
          class FieldReference
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # The projection of document's fields to return.
          # @!attribute [rw] fields
          #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference>]
          #     The fields to return.
          #
          #     If empty, all fields are returned. To only return the name
          #     of the document, use `['__name__']`.
          class Projection
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # A sort direction.
          module Direction
            # Unspecified.
            DIRECTION_UNSPECIFIED = 0

            # Ascending.
            ASCENDING = 1

            # Descending.
            DESCENDING = 2
          end
        end

        # Firestore query for running an aggregation over a
        # {::Google::Cloud::Firestore::V1::StructuredQuery StructuredQuery}.
        # @!attribute [rw] structured_query
        #   @return [::Google::Cloud::Firestore::V1::StructuredQuery]
        #     Nested structured query.
        # @!attribute [rw] aggregations
        #   @return [::Array<::Google::Cloud::Firestore::V1::StructuredAggregationQuery::Aggregation>]
        #     Optional. Series of aggregations to apply over the results of the
        #     `structured_query`.
        #
        #     Requires:
        #
        #     * A minimum of one and maximum of five aggregations per query.
        class StructuredAggregationQuery
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Defines a aggregation that produces a single result.
          # @!attribute [rw] count
          #   @return [::Google::Cloud::Firestore::V1::StructuredAggregationQuery::Aggregation::Count]
          #     Count aggregator.
          # @!attribute [rw] sum
          #   @return [::Google::Cloud::Firestore::V1::StructuredAggregationQuery::Aggregation::Sum]
          #     Sum aggregator.
          # @!attribute [rw] avg
          #   @return [::Google::Cloud::Firestore::V1::StructuredAggregationQuery::Aggregation::Avg]
          #     Average aggregator.
          # @!attribute [rw] alias
          #   @return [::String]
          #     Optional. Optional name of the field to store the result of the
          #     aggregation into.
          #
          #     If not provided, Firestore will pick a default name following the format
          #     `field_<incremental_id++>`. For example:
          #
          #     ```
          #     AGGREGATE
          #       COUNT_UP_TO(1) AS count_up_to_1,
          #       COUNT_UP_TO(2),
          #       COUNT_UP_TO(3) AS count_up_to_3,
          #       COUNT_UP_TO(4)
          #     OVER (
          #       ...
          #     );
          #     ```
          #
          #     becomes:
          #
          #     ```
          #     AGGREGATE
          #       COUNT_UP_TO(1) AS count_up_to_1,
          #       COUNT_UP_TO(2) AS field_1,
          #       COUNT_UP_TO(3) AS count_up_to_3,
          #       COUNT_UP_TO(4) AS field_2
          #     OVER (
          #       ...
          #     );
          #     ```
          #
          #     Requires:
          #
          #     * Must be unique across all aggregation aliases.
          #     * Conform to {::Google::Cloud::Firestore::V1::Document#fields document field name}
          #     limitations.
          class Aggregation
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Count of documents that match the query.
            #
            # The `COUNT(*)` aggregation function operates on the entire document
            # so it does not require a field reference.
            # @!attribute [rw] up_to
            #   @return [::Google::Protobuf::Int64Value]
            #     Optional. Optional constraint on the maximum number of documents to
            #     count.
            #
            #     This provides a way to set an upper bound on the number of documents
            #     to scan, limiting latency and cost.
            #
            #     Unspecified is interpreted as no bound.
            #
            #     High-Level Example:
            #
            #     ```
            #     AGGREGATE COUNT_UP_TO(1000) OVER ( SELECT * FROM k );
            #     ```
            #
            #     Requires:
            #
            #     * Must be greater than zero when present.
            class Count
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Sum of the values of the requested field.
            #
            # * Only numeric values will be aggregated. All non-numeric values
            # including `NULL` are skipped.
            #
            # * If the aggregated values contain `NaN`, returns `NaN`.
            #
            # * If the aggregated value set is empty, returns 0.
            #
            # * Returns a 64-bit integer if the sum result is an integer value and does
            # not overflow or underflow. Otherwise, the result is returned as a double.
            # @!attribute [rw] field
            #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference]
            #     The field to aggregate on.
            class Sum
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Average of the values of the requested field.
            #
            # * Only numeric values will be aggregated. All non-numeric values
            # including `NULL` are skipped.
            #
            # * If the aggregated values contain `NaN`, returns `NaN`.
            #
            # * If the aggregated value set is empty, returns `NULL`.
            #
            # * Always returns the result as a double.
            # @!attribute [rw] field
            #   @return [::Google::Cloud::Firestore::V1::StructuredQuery::FieldReference]
            #     The field to aggregate on.
            class Avg
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end
          end
        end

        # A position in a query result set.
        # @!attribute [rw] values
        #   @return [::Array<::Google::Cloud::Firestore::V1::Value>]
        #     The values that represent a position, in the order they appear in
        #     the order by clause of a query.
        #
        #     Can contain fewer values than specified in the order by clause.
        # @!attribute [rw] before
        #   @return [::Boolean]
        #     If the position is just before or just after the given values, relative
        #     to the sort order defined by the query.
        class Cursor
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
