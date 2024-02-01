# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/shopping/merchant/reports/v1beta/reports.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/protobuf/timestamp_pb'
require 'google/shopping/type/types_pb'
require 'google/type/date_pb'


descriptor_data = "\n5google/shopping/merchant/reports/v1beta/reports.proto\x12\'google.shopping.merchant.reports.v1beta\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a\x1fgoogle/protobuf/timestamp.proto\x1a google/shopping/type/types.proto\x1a\x16google/type/date.proto\"m\n\rSearchRequest\x12\x14\n\x06parent\x18\x01 \x01(\tB\x04\xe2\x41\x01\x02\x12\x13\n\x05query\x18\x02 \x01(\tB\x04\xe2\x41\x01\x02\x12\x17\n\tpage_size\x18\x03 \x01(\x05\x42\x04\xe2\x41\x01\x01\x12\x18\n\npage_token\x18\x04 \x01(\tB\x04\xe2\x41\x01\x01\"n\n\x0eSearchResponse\x12\x43\n\x07results\x18\x01 \x03(\x0b\x32\x32.google.shopping.merchant.reports.v1beta.ReportRow\x12\x17\n\x0fnext_page_token\x18\x02 \x01(\t\"\xe6\x07\n\tReportRow\x12\x61\n\x18product_performance_view\x18\x01 \x01(\x0b\x32?.google.shopping.merchant.reports.v1beta.ProductPerformanceView\x12J\n\x0cproduct_view\x18\x02 \x01(\x0b\x32\x34.google.shopping.merchant.reports.v1beta.ProductView\x12t\n\"price_competitiveness_product_view\x18\x03 \x01(\x0b\x32H.google.shopping.merchant.reports.v1beta.PriceCompetitivenessProductView\x12\x66\n\x1bprice_insights_product_view\x18\x04 \x01(\x0b\x32\x41.google.shopping.merchant.reports.v1beta.PriceInsightsProductView\x12q\n!best_sellers_product_cluster_view\x18\x05 \x01(\x0b\x32\x46.google.shopping.merchant.reports.v1beta.BestSellersProductClusterView\x12^\n\x17\x62\x65st_sellers_brand_view\x18\x06 \x01(\x0b\x32=.google.shopping.merchant.reports.v1beta.BestSellersBrandView\x12|\n&competitive_visibility_competitor_view\x18\x08 \x01(\x0b\x32L.google.shopping.merchant.reports.v1beta.CompetitiveVisibilityCompetitorView\x12\x7f\n(competitive_visibility_top_merchant_view\x18\t \x01(\x0b\x32M.google.shopping.merchant.reports.v1beta.CompetitiveVisibilityTopMerchantView\x12z\n%competitive_visibility_benchmark_view\x18\n \x01(\x0b\x32K.google.shopping.merchant.reports.v1beta.CompetitiveVisibilityBenchmarkView\"\xc1\n\n\x16ProductPerformanceView\x12k\n\x10marketing_method\x18\x01 \x01(\x0e\x32L.google.shopping.merchant.reports.v1beta.MarketingMethod.MarketingMethodEnumH\x00\x88\x01\x01\x12\x1f\n\x04\x64\x61te\x18\x02 \x01(\x0b\x32\x11.google.type.Date\x12\x1f\n\x04week\x18\x03 \x01(\x0b\x32\x11.google.type.Date\x12\"\n\x15\x63ustomer_country_code\x18\x04 \x01(\tH\x01\x88\x01\x01\x12\x15\n\x08offer_id\x18\x05 \x01(\tH\x02\x88\x01\x01\x12\x12\n\x05title\x18\x06 \x01(\tH\x03\x88\x01\x01\x12\x12\n\x05\x62rand\x18\x07 \x01(\tH\x04\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l1\x18\x08 \x01(\tH\x05\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l2\x18\t \x01(\tH\x06\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l3\x18\n \x01(\tH\x07\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l4\x18\x0b \x01(\tH\x08\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l5\x18\x0c \x01(\tH\t\x88\x01\x01\x12\x1c\n\x0fproduct_type_l1\x18\r \x01(\tH\n\x88\x01\x01\x12\x1c\n\x0fproduct_type_l2\x18\x0e \x01(\tH\x0b\x88\x01\x01\x12\x1c\n\x0fproduct_type_l3\x18\x0f \x01(\tH\x0c\x88\x01\x01\x12\x1c\n\x0fproduct_type_l4\x18\x10 \x01(\tH\r\x88\x01\x01\x12\x1c\n\x0fproduct_type_l5\x18\x11 \x01(\tH\x0e\x88\x01\x01\x12\x1a\n\rcustom_label0\x18\x12 \x01(\tH\x0f\x88\x01\x01\x12\x1a\n\rcustom_label1\x18\x13 \x01(\tH\x10\x88\x01\x01\x12\x1a\n\rcustom_label2\x18\x14 \x01(\tH\x11\x88\x01\x01\x12\x1a\n\rcustom_label3\x18\x15 \x01(\tH\x12\x88\x01\x01\x12\x1a\n\rcustom_label4\x18\x16 \x01(\tH\x13\x88\x01\x01\x12\x13\n\x06\x63licks\x18\x17 \x01(\x03H\x14\x88\x01\x01\x12\x18\n\x0bimpressions\x18\x18 \x01(\x03H\x15\x88\x01\x01\x12\x1f\n\x12\x63lick_through_rate\x18\x19 \x01(\x01H\x16\x88\x01\x01\x12\x18\n\x0b\x63onversions\x18\x1a \x01(\x01H\x17\x88\x01\x01\x12\x35\n\x10\x63onversion_value\x18\x1b \x01(\x0b\x32\x1b.google.shopping.type.Price\x12\x1c\n\x0f\x63onversion_rate\x18\x1c \x01(\x01H\x18\x88\x01\x01\x42\x13\n\x11_marketing_methodB\x18\n\x16_customer_country_codeB\x0b\n\t_offer_idB\x08\n\x06_titleB\x08\n\x06_brandB\x0e\n\x0c_category_l1B\x0e\n\x0c_category_l2B\x0e\n\x0c_category_l3B\x0e\n\x0c_category_l4B\x0e\n\x0c_category_l5B\x12\n\x10_product_type_l1B\x12\n\x10_product_type_l2B\x12\n\x10_product_type_l3B\x12\n\x10_product_type_l4B\x12\n\x10_product_type_l5B\x10\n\x0e_custom_label0B\x10\n\x0e_custom_label1B\x10\n\x0e_custom_label2B\x10\n\x0e_custom_label3B\x10\n\x0e_custom_label4B\t\n\x07_clicksB\x0e\n\x0c_impressionsB\x15\n\x13_click_through_rateB\x0e\n\x0c_conversionsB\x12\n\x10_conversion_rate\"\xd6\x15\n\x0bProductView\x12\x0f\n\x02id\x18\x01 \x01(\tH\x00\x88\x01\x01\x12?\n\x07\x63hannel\x18\x1c \x01(\x0e\x32).google.shopping.type.Channel.ChannelEnumH\x01\x88\x01\x01\x12\x1a\n\rlanguage_code\x18\x02 \x01(\tH\x02\x88\x01\x01\x12\x17\n\nfeed_label\x18\x03 \x01(\tH\x03\x88\x01\x01\x12\x15\n\x08offer_id\x18\x04 \x01(\tH\x04\x88\x01\x01\x12\x12\n\x05title\x18\x05 \x01(\tH\x05\x88\x01\x01\x12\x12\n\x05\x62rand\x18\x06 \x01(\tH\x06\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l1\x18\x07 \x01(\tH\x07\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l2\x18\x08 \x01(\tH\x08\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l3\x18\t \x01(\tH\t\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l4\x18\n \x01(\tH\n\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l5\x18\x0b \x01(\tH\x0b\x88\x01\x01\x12\x1c\n\x0fproduct_type_l1\x18\x0c \x01(\tH\x0c\x88\x01\x01\x12\x1c\n\x0fproduct_type_l2\x18\r \x01(\tH\r\x88\x01\x01\x12\x1c\n\x0fproduct_type_l3\x18\x0e \x01(\tH\x0e\x88\x01\x01\x12\x1c\n\x0fproduct_type_l4\x18\x0f \x01(\tH\x0f\x88\x01\x01\x12\x1c\n\x0fproduct_type_l5\x18\x10 \x01(\tH\x10\x88\x01\x01\x12*\n\x05price\x18\x11 \x01(\x0b\x32\x1b.google.shopping.type.Price\x12\x16\n\tcondition\x18\x12 \x01(\tH\x11\x88\x01\x01\x12\x19\n\x0c\x61vailability\x18\x13 \x01(\tH\x12\x88\x01\x01\x12\x1b\n\x0eshipping_label\x18\x14 \x01(\tH\x13\x88\x01\x01\x12\x0c\n\x04gtin\x18\x15 \x03(\t\x12\x1a\n\ritem_group_id\x18\x16 \x01(\tH\x14\x88\x01\x01\x12\x1b\n\x0ethumbnail_link\x18\x17 \x01(\tH\x15\x88\x01\x01\x12\x31\n\rcreation_time\x18\x18 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12*\n\x0f\x65xpiration_date\x18\x19 \x01(\x0b\x32\x11.google.type.Date\x12\x87\x01\n#aggregated_reporting_context_status\x18\x1a \x01(\x0e\x32U.google.shopping.merchant.reports.v1beta.ProductView.AggregatedReportingContextStatusH\x16\x88\x01\x01\x12S\n\x0bitem_issues\x18\x1b \x03(\x0b\x32>.google.shopping.merchant.reports.v1beta.ProductView.ItemIssue\x1a\xb3\t\n\tItemIssue\x12Z\n\x04type\x18\x01 \x01(\x0b\x32L.google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueType\x12\x62\n\x08severity\x18\x02 \x01(\x0b\x32P.google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueSeverity\x12k\n\nresolution\x18\x03 \x01(\x0e\x32R.google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueResolutionH\x00\x88\x01\x01\x1a\x65\n\rItemIssueType\x12\x11\n\x04\x63ode\x18\x01 \x01(\tH\x00\x88\x01\x01\x12 \n\x13\x63\x61nonical_attribute\x18\x02 \x01(\tH\x01\x88\x01\x01\x42\x07\n\x05_codeB\x16\n\x14_canonical_attribute\x1a\x97\x05\n\x11ItemIssueSeverity\x12\x99\x01\n\x1eseverity_per_reporting_context\x18\x01 \x03(\x0b\x32q.google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueSeverity.IssueSeverityPerReportingContext\x12\x8a\x01\n\x13\x61ggregated_severity\x18\x02 \x01(\x0e\x32h.google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueSeverity.AggregatedIssueSeverityH\x00\x88\x01\x01\x1a\xcf\x01\n IssueSeverityPerReportingContext\x12[\n\x11reporting_context\x18\x01 \x01(\x0e\x32;.google.shopping.type.ReportingContext.ReportingContextEnumH\x00\x88\x01\x01\x12\x1d\n\x15\x64isapproved_countries\x18\x02 \x03(\t\x12\x19\n\x11\x64\x65moted_countries\x18\x03 \x03(\tB\x14\n\x12_reporting_context\"o\n\x17\x41ggregatedIssueSeverity\x12)\n%AGGREGATED_ISSUE_SEVERITY_UNSPECIFIED\x10\x00\x12\x0f\n\x0b\x44ISAPPROVED\x10\x01\x12\x0b\n\x07\x44\x45MOTED\x10\x02\x12\x0b\n\x07PENDING\x10\x03\x42\x16\n\x14_aggregated_severity\"i\n\x13ItemIssueResolution\x12%\n!ITEM_ISSUE_RESOLUTION_UNSPECIFIED\x10\x00\x12\x13\n\x0fMERCHANT_ACTION\x10\x01\x12\x16\n\x12PENDING_PROCESSING\x10\x02\x42\r\n\x0b_resolution\"\xa9\x01\n AggregatedReportingContextStatus\x12\x33\n/AGGREGATED_REPORTING_CONTEXT_STATUS_UNSPECIFIED\x10\x00\x12\x1f\n\x1bNOT_ELIGIBLE_OR_DISAPPROVED\x10\x01\x12\x0b\n\x07PENDING\x10\x02\x12\x14\n\x10\x45LIGIBLE_LIMITED\x10\x03\x12\x0c\n\x08\x45LIGIBLE\x10\x04\x42\x05\n\x03_idB\n\n\x08_channelB\x10\n\x0e_language_codeB\r\n\x0b_feed_labelB\x0b\n\t_offer_idB\x08\n\x06_titleB\x08\n\x06_brandB\x0e\n\x0c_category_l1B\x0e\n\x0c_category_l2B\x0e\n\x0c_category_l3B\x0e\n\x0c_category_l4B\x0e\n\x0c_category_l5B\x12\n\x10_product_type_l1B\x12\n\x10_product_type_l2B\x12\n\x10_product_type_l3B\x12\n\x10_product_type_l4B\x12\n\x10_product_type_l5B\x0c\n\n_conditionB\x0f\n\r_availabilityB\x11\n\x0f_shipping_labelB\x10\n\x0e_item_group_idB\x11\n\x0f_thumbnail_linkB&\n$_aggregated_reporting_context_status\"\x81\x06\n\x1fPriceCompetitivenessProductView\x12 \n\x13report_country_code\x18\x01 \x01(\tH\x00\x88\x01\x01\x12\x0f\n\x02id\x18\x02 \x01(\tH\x01\x88\x01\x01\x12\x15\n\x08offer_id\x18\x03 \x01(\tH\x02\x88\x01\x01\x12\x12\n\x05title\x18\x04 \x01(\tH\x03\x88\x01\x01\x12\x12\n\x05\x62rand\x18\x05 \x01(\tH\x04\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l1\x18\x06 \x01(\tH\x05\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l2\x18\x07 \x01(\tH\x06\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l3\x18\x08 \x01(\tH\x07\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l4\x18\t \x01(\tH\x08\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l5\x18\n \x01(\tH\t\x88\x01\x01\x12\x1c\n\x0fproduct_type_l1\x18\x0b \x01(\tH\n\x88\x01\x01\x12\x1c\n\x0fproduct_type_l2\x18\x0c \x01(\tH\x0b\x88\x01\x01\x12\x1c\n\x0fproduct_type_l3\x18\r \x01(\tH\x0c\x88\x01\x01\x12\x1c\n\x0fproduct_type_l4\x18\x0e \x01(\tH\r\x88\x01\x01\x12\x1c\n\x0fproduct_type_l5\x18\x0f \x01(\tH\x0e\x88\x01\x01\x12*\n\x05price\x18\x10 \x01(\x0b\x32\x1b.google.shopping.type.Price\x12\x34\n\x0f\x62\x65nchmark_price\x18\x11 \x01(\x0b\x32\x1b.google.shopping.type.PriceB\x16\n\x14_report_country_codeB\x05\n\x03_idB\x0b\n\t_offer_idB\x08\n\x06_titleB\x08\n\x06_brandB\x0e\n\x0c_category_l1B\x0e\n\x0c_category_l2B\x0e\n\x0c_category_l3B\x0e\n\x0c_category_l4B\x0e\n\x0c_category_l5B\x12\n\x10_product_type_l1B\x12\n\x10_product_type_l2B\x12\n\x10_product_type_l3B\x12\n\x10_product_type_l4B\x12\n\x10_product_type_l5\"\xd0\x07\n\x18PriceInsightsProductView\x12\x0f\n\x02id\x18\x01 \x01(\tH\x00\x88\x01\x01\x12\x15\n\x08offer_id\x18\x02 \x01(\tH\x01\x88\x01\x01\x12\x12\n\x05title\x18\x03 \x01(\tH\x02\x88\x01\x01\x12\x12\n\x05\x62rand\x18\x04 \x01(\tH\x03\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l1\x18\x05 \x01(\tH\x04\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l2\x18\x06 \x01(\tH\x05\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l3\x18\x07 \x01(\tH\x06\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l4\x18\x08 \x01(\tH\x07\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l5\x18\t \x01(\tH\x08\x88\x01\x01\x12\x1c\n\x0fproduct_type_l1\x18\n \x01(\tH\t\x88\x01\x01\x12\x1c\n\x0fproduct_type_l2\x18\x0b \x01(\tH\n\x88\x01\x01\x12\x1c\n\x0fproduct_type_l3\x18\x0c \x01(\tH\x0b\x88\x01\x01\x12\x1c\n\x0fproduct_type_l4\x18\r \x01(\tH\x0c\x88\x01\x01\x12\x1c\n\x0fproduct_type_l5\x18\x0e \x01(\tH\r\x88\x01\x01\x12*\n\x05price\x18\x0f \x01(\x0b\x32\x1b.google.shopping.type.Price\x12\x34\n\x0fsuggested_price\x18\x10 \x01(\x0b\x32\x1b.google.shopping.type.Price\x12\x32\n%predicted_impressions_change_fraction\x18\x11 \x01(\x01H\x0e\x88\x01\x01\x12-\n predicted_clicks_change_fraction\x18\x12 \x01(\x01H\x0f\x88\x01\x01\x12\x32\n%predicted_conversions_change_fraction\x18\x13 \x01(\x01H\x10\x88\x01\x01\x42\x05\n\x03_idB\x0b\n\t_offer_idB\x08\n\x06_titleB\x08\n\x06_brandB\x0e\n\x0c_category_l1B\x0e\n\x0c_category_l2B\x0e\n\x0c_category_l3B\x0e\n\x0c_category_l4B\x0e\n\x0c_category_l5B\x12\n\x10_product_type_l1B\x12\n\x10_product_type_l2B\x12\n\x10_product_type_l3B\x12\n\x10_product_type_l4B\x12\n\x10_product_type_l5B(\n&_predicted_impressions_change_fractionB#\n!_predicted_clicks_change_fractionB(\n&_predicted_conversions_change_fraction\"\xf0\x0b\n\x1d\x42\x65stSellersProductClusterView\x12&\n\x0breport_date\x18\x01 \x01(\x0b\x32\x11.google.type.Date\x12q\n\x12report_granularity\x18\x02 \x01(\x0e\x32P.google.shopping.merchant.reports.v1beta.ReportGranularity.ReportGranularityEnumH\x00\x88\x01\x01\x12 \n\x13report_country_code\x18\x03 \x01(\tH\x01\x88\x01\x01\x12\x1f\n\x12report_category_id\x18\x04 \x01(\x03H\x02\x88\x01\x01\x12\x12\n\x05title\x18\x06 \x01(\tH\x03\x88\x01\x01\x12\x12\n\x05\x62rand\x18\x07 \x01(\tH\x04\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l1\x18\x08 \x01(\tH\x05\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l2\x18\t \x01(\tH\x06\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l3\x18\n \x01(\tH\x07\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l4\x18\x0b \x01(\tH\x08\x88\x01\x01\x12\x18\n\x0b\x63\x61tegory_l5\x18\x0c \x01(\tH\t\x88\x01\x01\x12\x15\n\rvariant_gtins\x18\r \x03(\t\x12u\n\x10inventory_status\x18\x0e \x01(\x0e\x32V.google.shopping.merchant.reports.v1beta.BestSellersProductClusterView.InventoryStatusH\n\x88\x01\x01\x12{\n\x16\x62rand_inventory_status\x18\x0f \x01(\x0e\x32V.google.shopping.merchant.reports.v1beta.BestSellersProductClusterView.InventoryStatusH\x0b\x88\x01\x01\x12\x11\n\x04rank\x18\x10 \x01(\x03H\x0c\x88\x01\x01\x12\x1a\n\rprevious_rank\x18\x11 \x01(\x03H\r\x88\x01\x01\x12h\n\x0frelative_demand\x18\x12 \x01(\x0e\x32J.google.shopping.merchant.reports.v1beta.RelativeDemand.RelativeDemandEnumH\x0e\x88\x01\x01\x12q\n\x18previous_relative_demand\x18\x13 \x01(\x0e\x32J.google.shopping.merchant.reports.v1beta.RelativeDemand.RelativeDemandEnumH\x0f\x88\x01\x01\x12\x83\x01\n\x16relative_demand_change\x18\x14 \x01(\x0e\x32^.google.shopping.merchant.reports.v1beta.RelativeDemandChangeType.RelativeDemandChangeTypeEnumH\x10\x88\x01\x01\"i\n\x0fInventoryStatus\x12 \n\x1cINVENTORY_STATUS_UNSPECIFIED\x10\x00\x12\x0c\n\x08IN_STOCK\x10\x01\x12\x10\n\x0cOUT_OF_STOCK\x10\x02\x12\x14\n\x10NOT_IN_INVENTORY\x10\x03\x42\x15\n\x13_report_granularityB\x16\n\x14_report_country_codeB\x15\n\x13_report_category_idB\x08\n\x06_titleB\x08\n\x06_brandB\x0e\n\x0c_category_l1B\x0e\n\x0c_category_l2B\x0e\n\x0c_category_l3B\x0e\n\x0c_category_l4B\x0e\n\x0c_category_l5B\x13\n\x11_inventory_statusB\x19\n\x17_brand_inventory_statusB\x07\n\x05_rankB\x10\n\x0e_previous_rankB\x12\n\x10_relative_demandB\x1b\n\x19_previous_relative_demandB\x19\n\x17_relative_demand_change\"\xd1\x06\n\x14\x42\x65stSellersBrandView\x12&\n\x0breport_date\x18\x01 \x01(\x0b\x32\x11.google.type.Date\x12q\n\x12report_granularity\x18\x02 \x01(\x0e\x32P.google.shopping.merchant.reports.v1beta.ReportGranularity.ReportGranularityEnumH\x00\x88\x01\x01\x12 \n\x13report_country_code\x18\x03 \x01(\tH\x01\x88\x01\x01\x12\x1f\n\x12report_category_id\x18\x04 \x01(\x03H\x02\x88\x01\x01\x12\x12\n\x05\x62rand\x18\x06 \x01(\tH\x03\x88\x01\x01\x12\x11\n\x04rank\x18\x07 \x01(\x03H\x04\x88\x01\x01\x12\x1a\n\rprevious_rank\x18\x08 \x01(\x03H\x05\x88\x01\x01\x12h\n\x0frelative_demand\x18\t \x01(\x0e\x32J.google.shopping.merchant.reports.v1beta.RelativeDemand.RelativeDemandEnumH\x06\x88\x01\x01\x12q\n\x18previous_relative_demand\x18\n \x01(\x0e\x32J.google.shopping.merchant.reports.v1beta.RelativeDemand.RelativeDemandEnumH\x07\x88\x01\x01\x12\x83\x01\n\x16relative_demand_change\x18\x0b \x01(\x0e\x32^.google.shopping.merchant.reports.v1beta.RelativeDemandChangeType.RelativeDemandChangeTypeEnumH\x08\x88\x01\x01\x42\x15\n\x13_report_granularityB\x16\n\x14_report_country_codeB\x15\n\x13_report_category_idB\x08\n\x06_brandB\x07\n\x05_rankB\x10\n\x0e_previous_rankB\x12\n\x10_relative_demandB\x1b\n\x19_previous_relative_demandB\x19\n\x17_relative_demand_change\"\x80\x05\n#CompetitiveVisibilityCompetitorView\x12\x1f\n\x04\x64\x61te\x18\x01 \x01(\x0b\x32\x11.google.type.Date\x12\x13\n\x06\x64omain\x18\x02 \x01(\tH\x00\x88\x01\x01\x12\x1b\n\x0eis_your_domain\x18\x03 \x01(\x08H\x01\x88\x01\x01\x12 \n\x13report_country_code\x18\x04 \x01(\tH\x02\x88\x01\x01\x12\x1f\n\x12report_category_id\x18\x05 \x01(\x03H\x03\x88\x01\x01\x12\x65\n\x0etraffic_source\x18\x06 \x01(\x0e\x32H.google.shopping.merchant.reports.v1beta.TrafficSource.TrafficSourceEnumH\x04\x88\x01\x01\x12\x11\n\x04rank\x18\x07 \x01(\x03H\x05\x88\x01\x01\x12\x1e\n\x11\x61\x64s_organic_ratio\x18\x08 \x01(\x01H\x06\x88\x01\x01\x12\x1e\n\x11page_overlap_rate\x18\t \x01(\x01H\x07\x88\x01\x01\x12!\n\x14higher_position_rate\x18\n \x01(\x01H\x08\x88\x01\x01\x12 \n\x13relative_visibility\x18\x0b \x01(\x01H\t\x88\x01\x01\x42\t\n\x07_domainB\x11\n\x0f_is_your_domainB\x16\n\x14_report_country_codeB\x15\n\x13_report_category_idB\x11\n\x0f_traffic_sourceB\x07\n\x05_rankB\x14\n\x12_ads_organic_ratioB\x14\n\x12_page_overlap_rateB\x17\n\x15_higher_position_rateB\x16\n\x14_relative_visibility\"\xc7\x04\n$CompetitiveVisibilityTopMerchantView\x12\x1f\n\x04\x64\x61te\x18\x01 \x01(\x0b\x32\x11.google.type.Date\x12\x13\n\x06\x64omain\x18\x02 \x01(\tH\x00\x88\x01\x01\x12\x1b\n\x0eis_your_domain\x18\x03 \x01(\x08H\x01\x88\x01\x01\x12 \n\x13report_country_code\x18\x04 \x01(\tH\x02\x88\x01\x01\x12\x1f\n\x12report_category_id\x18\x05 \x01(\x03H\x03\x88\x01\x01\x12\x65\n\x0etraffic_source\x18\x06 \x01(\x0e\x32H.google.shopping.merchant.reports.v1beta.TrafficSource.TrafficSourceEnumH\x04\x88\x01\x01\x12\x11\n\x04rank\x18\x07 \x01(\x03H\x05\x88\x01\x01\x12\x1e\n\x11\x61\x64s_organic_ratio\x18\x08 \x01(\x01H\x06\x88\x01\x01\x12\x1e\n\x11page_overlap_rate\x18\t \x01(\x01H\x07\x88\x01\x01\x12!\n\x14higher_position_rate\x18\n \x01(\x01H\x08\x88\x01\x01\x42\t\n\x07_domainB\x11\n\x0f_is_your_domainB\x16\n\x14_report_country_codeB\x15\n\x13_report_category_idB\x11\n\x0f_traffic_sourceB\x07\n\x05_rankB\x14\n\x12_ads_organic_ratioB\x14\n\x12_page_overlap_rateB\x17\n\x15_higher_position_rate\"\xd7\x03\n\"CompetitiveVisibilityBenchmarkView\x12\x1f\n\x04\x64\x61te\x18\x01 \x01(\x0b\x32\x11.google.type.Date\x12 \n\x13report_country_code\x18\x02 \x01(\tH\x00\x88\x01\x01\x12\x1f\n\x12report_category_id\x18\x03 \x01(\x03H\x01\x88\x01\x01\x12\x65\n\x0etraffic_source\x18\x04 \x01(\x0e\x32H.google.shopping.merchant.reports.v1beta.TrafficSource.TrafficSourceEnumH\x02\x88\x01\x01\x12)\n\x1cyour_domain_visibility_trend\x18\x05 \x01(\x01H\x03\x88\x01\x01\x12\x30\n#category_benchmark_visibility_trend\x18\x06 \x01(\x01H\x04\x88\x01\x01\x42\x16\n\x14_report_country_codeB\x15\n\x13_report_category_idB\x11\n\x0f_traffic_sourceB\x1f\n\x1d_your_domain_visibility_trendB&\n$_category_benchmark_visibility_trend\"e\n\x0fMarketingMethod\"R\n\x13MarketingMethodEnum\x12%\n!MARKETING_METHOD_ENUM_UNSPECIFIED\x10\x00\x12\x0b\n\x07ORGANIC\x10\x01\x12\x07\n\x03\x41\x44S\x10\x02\"n\n\x11ReportGranularity\"Y\n\x15ReportGranularityEnum\x12\'\n#REPORT_GRANULARITY_ENUM_UNSPECIFIED\x10\x00\x12\n\n\x06WEEKLY\x10\x01\x12\x0b\n\x07MONTHLY\x10\x02\"\x88\x01\n\x0eRelativeDemand\"v\n\x12RelativeDemandEnum\x12$\n RELATIVE_DEMAND_ENUM_UNSPECIFIED\x10\x00\x12\x0c\n\x08VERY_LOW\x10\n\x12\x07\n\x03LOW\x10\x14\x12\n\n\x06MEDIUM\x10\x1e\x12\x08\n\x04HIGH\x10(\x12\r\n\tVERY_HIGH\x10\x32\"\x8d\x01\n\x18RelativeDemandChangeType\"q\n\x1cRelativeDemandChangeTypeEnum\x12\x30\n,RELATIVE_DEMAND_CHANGE_TYPE_ENUM_UNSPECIFIED\x10\x00\x12\n\n\x06SINKER\x10\x01\x12\x08\n\x04\x46LAT\x10\x02\x12\t\n\x05RISER\x10\x03\"h\n\rTrafficSource\"W\n\x11TrafficSourceEnum\x12#\n\x1fTRAFFIC_SOURCE_ENUM_UNSPECIFIED\x10\x00\x12\x0b\n\x07ORGANIC\x10\x01\x12\x07\n\x03\x41\x44S\x10\x02\x12\x07\n\x03\x41LL\x10\x03\x32\x9c\x02\n\rReportService\x12\xc1\x01\n\x06Search\x12\x36.google.shopping.merchant.reports.v1beta.SearchRequest\x1a\x37.google.shopping.merchant.reports.v1beta.SearchResponse\"F\xda\x41\x06parent\x82\xd3\xe4\x93\x02\x37\"2/reports/v1beta/{parent=accounts/*}/reports:search:\x01*\x1aG\xca\x41\x1amerchantapi.googleapis.com\xd2\x41\'https://www.googleapis.com/auth/contentB\x8a\x01\n+com.google.shopping.merchant.reports.v1betaB\x0cReportsProtoP\x01ZKcloud.google.com/go/shopping/merchant/reports/apiv1beta/reportspb;reportspbb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
    ["google.type.Date", "google/type/date.proto"],
    ["google.shopping.type.Price", "google/shopping/type/types.proto"],
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Shopping
    module Merchant
      module Reports
        module V1beta
          SearchRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.SearchRequest").msgclass
          SearchResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.SearchResponse").msgclass
          ReportRow = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ReportRow").msgclass
          ProductPerformanceView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductPerformanceView").msgclass
          ProductView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductView").msgclass
          ProductView::ItemIssue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductView.ItemIssue").msgclass
          ProductView::ItemIssue::ItemIssueType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueType").msgclass
          ProductView::ItemIssue::ItemIssueSeverity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueSeverity").msgclass
          ProductView::ItemIssue::ItemIssueSeverity::IssueSeverityPerReportingContext = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueSeverity.IssueSeverityPerReportingContext").msgclass
          ProductView::ItemIssue::ItemIssueSeverity::AggregatedIssueSeverity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueSeverity.AggregatedIssueSeverity").enummodule
          ProductView::ItemIssue::ItemIssueResolution = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductView.ItemIssue.ItemIssueResolution").enummodule
          ProductView::AggregatedReportingContextStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ProductView.AggregatedReportingContextStatus").enummodule
          PriceCompetitivenessProductView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.PriceCompetitivenessProductView").msgclass
          PriceInsightsProductView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.PriceInsightsProductView").msgclass
          BestSellersProductClusterView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.BestSellersProductClusterView").msgclass
          BestSellersProductClusterView::InventoryStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.BestSellersProductClusterView.InventoryStatus").enummodule
          BestSellersBrandView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.BestSellersBrandView").msgclass
          CompetitiveVisibilityCompetitorView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.CompetitiveVisibilityCompetitorView").msgclass
          CompetitiveVisibilityTopMerchantView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.CompetitiveVisibilityTopMerchantView").msgclass
          CompetitiveVisibilityBenchmarkView = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.CompetitiveVisibilityBenchmarkView").msgclass
          MarketingMethod = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.MarketingMethod").msgclass
          MarketingMethod::MarketingMethodEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.MarketingMethod.MarketingMethodEnum").enummodule
          ReportGranularity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ReportGranularity").msgclass
          ReportGranularity::ReportGranularityEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.ReportGranularity.ReportGranularityEnum").enummodule
          RelativeDemand = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.RelativeDemand").msgclass
          RelativeDemand::RelativeDemandEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.RelativeDemand.RelativeDemandEnum").enummodule
          RelativeDemandChangeType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.RelativeDemandChangeType").msgclass
          RelativeDemandChangeType::RelativeDemandChangeTypeEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.RelativeDemandChangeType.RelativeDemandChangeTypeEnum").enummodule
          TrafficSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.TrafficSource").msgclass
          TrafficSource::TrafficSourceEnum = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.shopping.merchant.reports.v1beta.TrafficSource.TrafficSourceEnum").enummodule
        end
      end
    end
  end
end
